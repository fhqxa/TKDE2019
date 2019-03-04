
data_label is the class label of training set.
data_instis the feature set of training set.

model = svmtrain(data_label,data_inst, '-c 1 -g 0.07');


testdata_label is the class label of test dataset.
teatdata_inst is feature set of test dataset.
[predict_label, accuracy, dec_values] =svmpredict(testdata_label,teatdata_inst, model); % test the trainingdata