∂¡»Îmat∏Ò Ω
model = svmtrain(heart_scale_label,heart_scale_inst, '-c 1 -g 0.07');

[predict_label, accuracy, dec_values] =svmpredict(heart_scale_label,heart_scale_inst, model); % test the trainingdata