import tensorflow.compat.v1  as tf
TRAIN = "https://storage.googleapis.com/tf-datasets/titanic/train.csv"
TEST = "https://storage.googleapis.com/tf-datasets/titanic/eval.csv"
train_file_path = tf.keras.utils.get_file ("train.csv", TRAIN)
test_file_path = tf.keras.utils.get_file ("eval.csv", TEST)
LABEL_COLUMN = 'survived'
LABELS = [0, 1]

def get_dataset(file_path, **kwargs):
    dataset = tf.data.experimental.make_csv_dataset(
      file_path,
      label_name=LABEL_COLUMN,
      batch_size=5,
      na_value="?",
      num_epochs=1,
      ignore_errors=True, 
      **kwargs)
    return dataset

raw_train_data = get_dataset(train_file_path)
raw_test_data = get_dataset(test_file_path)

def show_batch(dataset):
    for batch, label in dataset.take(1):
        for key, value in batch.items():
            print("{:20s}: {}".format(key,value.numpy()))
            

    
# create feature columns for model    
def generat_feature_coulumns(NUMERIC_FEATURES,CATEGORIES):
    numeric_columns = []
    for feature in NUMERIC_FEATURES:
      num_col = tf.feature_column.numeric_column(key=feature)
      numeric_columns.append(num_col)
    
    categorical_columns = []
    for feature, vocab in CATEGORIES.items():
      cat_col = tf.feature_column.categorical_column_with_vocabulary_list(
            key=feature, vocabulary_list=vocab)
      categorical_columns.append(tf.feature_column.indicator_column(cat_col))
    return   numeric_columns,categorical_columns


# set parameters
params = {
        'label' : 'survived',
        'labels': [0,1],
        'train' : 'dataset/train.csv',
        'test' : 'dataset/eval.csv'  ,
        'model_dir' : 'results/'
        }

# set the numeric and categorical feature,values
NUMERIC_FEATURES = ['age','n_siblings_spouses','parch', 'fare']
CATEGORIES = {
    'sex': ['male', 'female'],
    'class' : ['First', 'Second', 'Third'],
    'deck' : ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'],
    'embark_town' : ['Cherbourg', 'Southhampton', 'Queenstown'],
    'alone' : ['y', 'n']
    }
# generating columns for numeric and categorical feature 
numeric_columns,categorical_columns =  generat_feature_coulumns(NUMERIC_FEATURES,CATEGORIES)
# make mixed feature layer
preprocessing_layer = tf.keras.layers.DenseFeatures(categorical_columns+numeric_columns)

model = tf.keras.Sequential([
  preprocessing_layer,
  tf.keras.layers.Dense(128, activation='relu'),
  tf.keras.layers.Dense(128, activation='relu'),
  tf.keras.layers.Dense(1),
])

# compile the model
model.compile(
    loss=tf.keras.losses.BinaryCrossentropy(from_logits=True),
    optimizer='adam',
    metrics=['accuracy'])

# Train, evaluate, and predict
train_data = raw_train_data.shuffle(500) 
test_data = raw_test_data
model.fit(train_data, epochs=20)    


test_loss, test_accuracy = model.evaluate(test_data)
print('\n\nTest Loss {}, Test Accuracy {}'.format(test_loss, test_accuracy))
predictions = model.predict(test_data)
for prediction, survived in zip(predictions[:10], list(test_data)[0][1][:10]):
    prediction = tf.sigmoid(prediction).numpy() 
    print("Predicted survival: {:.2%}".format(prediction[0])," | Actual outcome: ",
          ("SURVIVED" if bool(survived) else "DIED"))

