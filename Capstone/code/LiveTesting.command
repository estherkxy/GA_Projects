#!/usr/bin/env python
# coding: utf-8

# In[10]:


import torch
import transformers
import tensorflow as tf
import pandas as pd
import numpy as np

from transformers import BertForSequenceClassification, AdamW, BertConfig, BertTokenizer
from torch.utils.data import TensorDataset, DataLoader, RandomSampler, SequentialSampler
from keras.preprocessing.sequence import pad_sequences
print('Transformers version: ', transformers.__version__)
print('Tensorflow version: ', tf.__version__)

if torch.cuda.is_available():     
    device = torch.device("cuda")
    print('There are %d GPU(s) available.' % torch.cuda.device_count())
    print('We will use the GPU:', torch.cuda.get_device_name(0))
else:
    print('No GPU available, using the CPU instead.')
    device = torch.device("cpu")

output_dir = '/Users/estherkhor/Desktop/GA-DSI/DSI-SG-26-workspace/capstone/data/BERT with cleaned tweets' 

model = BertForSequenceClassification.from_pretrained(output_dir)
tokenizer = BertTokenizer.from_pretrained(output_dir)

model.to(device)

def live_test():
    while True:
        tweettext = input("Enter a tweet: ")
        testing = {'text': [tweettext]}
        testing_df = pd.DataFrame(testing)
        testing_df['bert_predict'] = 0
        tweets = testing_df.text.values
        labels = testing_df.bert_predict.values
        input_ids = []

        for tweet in tweets:
            encoded_tweet = tokenizer.encode( tweet, add_special_tokens = True )
            input_ids.append(encoded_tweet)

        MAX_LEN = max([len(i) for i in input_ids])
        input_ids = pad_sequences(input_ids, maxlen=MAX_LEN, dtype="long", truncating="post", padding="post")

        attention_masks = []

        for seq in input_ids:
            seq_mask = [float(i>0) for i in seq]
            attention_masks.append(seq_mask) 

        prediction_inputs = torch.tensor(input_ids)
        prediction_masks = torch.tensor(attention_masks)
        prediction_labels = torch.tensor(labels)

        batch_size = 32  

        prediction_data = TensorDataset(prediction_inputs, prediction_masks, prediction_labels)
        prediction_sampler = SequentialSampler(prediction_data)
        prediction_dataloader = DataLoader(prediction_data, sampler=prediction_sampler, batch_size=batch_size)

        print('Predicting labels for {:,} tweets...'.format(len(prediction_inputs)))

        model.eval()

        predictions_clean , true_labels = [], []

        for batch in prediction_dataloader:
            batch = tuple(t.to(device) for t in batch)
            b_input_ids, b_input_mask, b_labels = batch
            
            with torch.no_grad():
                outputs = model(b_input_ids, token_type_ids=None, 
                          attention_mask=b_input_mask)
            logits = outputs[0]

            logits = logits.detach().cpu().numpy()
            label_ids = b_labels.to('cpu').numpy()
            predictions_clean.append(logits)
            true_labels.append(label_ids)

        print('    DONE.')
        clean_flat_prediction = [item for sublist in predictions_clean for item in sublist]
        clean_flat_predictions = np.argmax(clean_flat_prediction, axis=1).flatten()
        testing_df['bert_predict'] = clean_flat_predictions

        if testing_df['bert_predict'][0] == 1:
            print('Tweet is negative')
        else:
            print('Tweet is not negative')

        new_tweet = input('Enter "y" for new tweet analysis: ')
        
        if new_tweet != 'y':
            
            break

live_test()

