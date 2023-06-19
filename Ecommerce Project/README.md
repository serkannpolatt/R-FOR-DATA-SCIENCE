## English
## Linear Regression Analysis on Customer Data
This code performs a linear regression analysis on customer data to explore the relationships between various variables and the yearly amount spent by customers. The analysis includes importing the data, creating plots, searching for correlations, exploring selected variables, fitting a linear model, analyzing residuals, evaluating the model's quality, and extending the analysis to multiple regression.

### Importing Data and Setup
The code starts by importing the customer data from a CSV file and examining its structure and summary statistics.

### Create Plots and Search for Correlations
Next, the code utilizes the ggplot2 library to create scatter plots to investigate the correlations between different variables and the yearly amount spent by customers. The plots explore the relationships between time spent on the website, average session length, and yearly amount spent. Additionally, a pair plot is created to visualize the relationships among all the continuous variables in the dataset.

### Exploring the Selected Variables
In this section, the code examines the distribution of the "Length of Membership" variable using both histograms and box plots. The normality assumption of the variable is assessed.

### Fitting a Linear Model
A linear regression model is fitted to predict the yearly amount spent based on the length of membership. The code calculates and displays the model's summary, including coefficients and p-values. Additionally, a scatter plot is generated to visualize the relationship between the predicted values and the length of membership.

### Residuals Analysis
The code performs residuals analysis to evaluate the assumptions of the linear model. It plots a quantile-quantile (QQ) plot of the residuals and conducts a Shapiro-Wilk normality test.

### Evaluate the Quality of the Model
A random training and testing set is created to evaluate the quality of the linear model. The code fits the linear model using the training set, makes predictions on the testing set, and calculates the root mean squared error (RMSE), mean absolute percentage error (MAPE), and R-squared value for the model.

### ultiple Regression
The analysis is extended to multiple regression, where the code fits a linear model with multiple predictor variables: average session length, time on the app, time on the website, and length of membership. The summary of the multiple regression model is displayed, including the coefficients and their significance.

### Evaluate the Multiple Regression Model
Similar to the evaluation of the simple linear regression model, a random training and testing set is created to evaluate the quality of the multiple regression model. The code fits the multiple regression model using the training set, makes predictions on the testing set, and calculates the RMSE, MAPE, and R-squared values for the model.

By conducting these analyses, the code provides insights into the relationships between different variables and the yearly amount spent by customers. It helps understand the impact of various factors on customer spending and provides a model for predicting the amount spent based on customer characteristics.

## Türkçe 
## Müşteri Verisi Üzerinde Doğrusal Regresyon Analizi
Bu kod, müşteri verisi üzerinde bir doğrusal regresyon analizi gerçekleştirerek çeşitli değişkenler ile müşterilerin yıllık harcamaları arasındaki ilişkileri keşfetmektedir. Analiz, veriyi içe aktarma, grafikler oluşturma, korelasyon arayışı, seçilen değişkenlerin incelenmesi, doğrusal bir modelin uyarlanması, kalıntı analizi, modelin kalitesinin değerlendirilmesi ve çoklu regresyona kadar uzanan bir süreci içermektedir.

### Veriyi İçe Aktarma ve Ayarlama
Kod, müşteri verisini bir CSV dosyasından içe aktararak verinin yapısını incelemekte ve özet istatistiklerini göstermektedir.

### Grafikler Oluşturma ve Korelasyon Araştırması
Daha sonra, kod ggplot2 kütüphanesini kullanarak müşterilerin yıllık harcamaları ile farklı değişkenler arasındaki korelasyonları araştırmak için nokta grafikleri oluşturur. Grafikler, web sitesinde geçirilen süre, ortalama oturum süresi ve yıllık harcama arasındaki ilişkileri keşfeder. Ayrıca, veri setindeki tüm sürekli değişkenler arasındaki ilişkileri görselleştirmek için bir çift grafik oluşturulur.

### Seçilen Değişkenlerin İncelenmesi
Bu bölümde, kod "Üyelik Süresi" değişkeninin dağılımını hem histogramlar hem de kutu grafikleri kullanarak inceler. Değişkenin normal dağılım varsayımı değerlendirilir.

### Doğrusal Model Uyarlama
Üyelik süresine dayanarak yıllık harcamayı tahmin etmek için bir doğrusal regresyon modeli uyarlanır. Kod, modelin katsayılarını ve p-değerlerini içeren özetini hesaplar ve görüntüler. Ayrıca, tahmin edilen değerler ile üyelik süresi arasındaki ilişkiyi görselleştiren bir scatter plot oluşturulur.

### Kalıntılar Analizi
Kod, doğrusal modelin varsayımlarını değerlendirmek için kalıntılar analizi gerçekleştirir. Kalıntıların quantile-quantile (QQ) grafiğini çizer ve Shapiro-Wilk normal dağılım testini uygular.

### Modelin Kalitesinin Değerlendirilmesi
Modelin kalitesini değerlendirmek için rastgele bir eğitim ve test seti oluşturulur. Kod, eğitim seti üzerinde doğrusal modeli uyarlar, test seti üzerinde tahminler yapar