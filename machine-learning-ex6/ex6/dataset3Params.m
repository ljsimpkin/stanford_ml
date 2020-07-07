function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% function sim = gaussianKernel(x1, x2, sigma);
% function [model] = svmTrain(X, Y, C, kernelFunction, ...
%                             tol, max_passes);

i1 = 0;
i2 = 0;
rep = 8;
multi = 3;
C_test = 0.01;
sigma_test_initial = 0.01;

model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
best_error = mean(double(predictions ~= yval));

while i1 < rep
	sigma_test = sigma_test_initial;
	while i2 <  rep
		model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
		predictions = svmPredict(model, Xval);
		test_error = mean(double(predictions ~= yval));
		if test_error < best_error
			best_error = test_error;
			C = C_test;
			sigma = sigma_test;
			fprintf("best error = %d, C_test = %d, sigma_test = %d", best_error, C_test, sigma_test);
		end;
		sigma_test *= multi;
		i2 += 1;
	end;
	C_test *= multi;
	i1 += 1;
	i2 = 0;
	fprintf("completed %d %%", i1/rep * 100);
end;






% =========================================================================

end
