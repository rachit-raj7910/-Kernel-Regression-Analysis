# Load necessary library
#install.packages("np")
if (!require("np")) install.packages("np", dependencies = TRUE)
library(np)

# Set file path for the uploaded CSV file
# For example: "C:/path/to/your/kernel_regression_data.csv"
file_path <- "C:/Users/rachi/Downloads/kernel_regression_data.csv"  # Use forward slashes or double backslashes

# Read the data from the CSV file
data <- read.csv(file_path)

# Check the first few rows of the data to ensure it's loaded correctly
head(data)

# Visualize the data
plot(data$Years_of_Experience, data$Salary, main = "Years of Experience vs. Salary",
     xlab = "Years of Experience", ylab = "Salary (in thousands)", pch = 19)

# Kernel regression model
kernel_model <- npreg(Salary ~ Years_of_Experience, data = data, regtype = "ll")

# Add the Kernel regression line to the plot
lines(data$Years_of_Experience[order(data$Years_of_Experience)], 
      fitted(kernel_model)[order(data$Years_of_Experience)], 
      col = "blue", lwd = 2)

# Summarize and interpret the model
summary(kernel_model)


# Residual plot
residuals <- data$Salary - fitted(kernel_model)
plot(data$Years_of_Experience, residuals, 
     main = "Residuals vs. Years of Experience",
     xlab = "Years of Experience", ylab = "Residuals", pch = 19)
abline(h = 0, col = "red", lwd = 2)


# Predicted vs. Actual plot
plot(fitted(kernel_model), data$Salary,
     main = "Predicted vs. Actual Salary",
     xlab = "Predicted Salary", ylab = "Actual Salary", pch = 19)
abline(0, 1, col = "blue", lwd = 2)




