# IMPORT DATA AND SETUP
# VERİYİ İÇE AKTARMA VE AYARLAMA
# ---------------------------------------------------------------------------
data <- read.csv("./data/customer-data")  # Veri okunuyor

str(data)  # Veri yapısı kontrol ediliyor
summary(data)  # Veri özetine bakılıyor

# ---------------------------------------------------------------------------
# CREATE PLOTS AND SEARCH FOR CORRELATIONS
# GRAFİK OLUŞTURMA VE KORELASYON ARAŞTIRMASI
# ---------------------------------------------------------------------------
library(ggplot2)

# Is there a correlation between Time on Website & Yearly Amount Spent?
# Web Sitesinde Geçirilen Süre ile Yıllık Harcama Arasında Bir Korelasyon Var mı?
ggplot(data, aes(x=Time.on.Website, y=Yearly.Amount.Spent)) + 
  geom_point(colour="orange") + 
  ggtitle("Time on website against vs Yearly amount spent") + 
  xlab("Time on Website") +
  ylab("Yearly Amount Spent")

# Is there a correlation between Avg Session Length & Yearly Amount Spent?
# Ortalama Oturum Süresi ile Yıllık Harcama Arasında Bir Korelasyon Var mı?
ggplot(data, aes(x=Avg..Session.Length, y=Yearly.Amount.Spent)) + 
  geom_point(colour="orange") +
  ggtitle("Average session length against vs Yearly amount spent") + 
  xlab("Time on Website") +
  ylab("Yearly Amount Spent")

# pairplot of all continuous variables -->
# Tüm sürekli değişkenlerin çiftler arası grafiği -->
#### length of membership seems the most correlated
#### Üyelik süresi en fazla ilişkili gibi görünüyor
pairs(data[c("Avg..Session.Length", 
             "Time.on.App", 
             "Time.on.Website", 
             "Length.of.Membership",
             "Yearly.Amount.Spent")],
      col = "orange",
      pch = 16,
      labels = c("Avg Session Length", 
                 "Time on App", 
                 "Time on website",
                 "Length of Membership",
                 "Yearly spent"),
      main = "Pairplot of variables")

# ---------------------------------------------------------------------------
# EXPLORING THE SELECTED VARIABLES
# SEÇİLEN DEĞİŞKENLERİN İNCELENMESİ
# ---------------------------------------------------------------------------

# is the variable normally distributed?
# Değişken normal dağılıma sahip mi?
hist(data$Length.of.Membership)
# with ggplot
# ggplot ile
ggplot(data, aes(x=Length.of.Membership)) + 
  geom_histogram(
    color= "white", 
    fill="orange",
    binwidth = 0.5)

# check distribution with boxplot
# Kutu grafiği ile dağılımı kontrol etme
boxplot(data$Length.of.Membership)
# with ggplot
# ggplot ile
ggplot(data, aes(x=Length.of.Membership)) + 
  geom_boxplot(
    fill="orange",
  )

# ---------------------------------------------------------------------------
# FITTING A LINEAR MODEL
# DOĞRUSAL MODEL UYARLAMA
# ---------------------------------------------------------------------------

attach(data)

lm.fit1 <- lm(Yearly.Amount.Spent~Length.of.Membership)

summary(lm.fit1)
# --> p value is below significance level, so the variable Length of 
#     membership is significant.
# --> beta_1 is 64.219, which means that an increase in the variable value
#     causes an increase in the target variable.

plot(Yearly.Amount.Spent~Length.of.Membership)
abline(lm.fit1, col="red")

# ---------------------------------------------------------------------------
# RESIDUALS ANALYSIS
# KALINTILAR ANALİZİ
# ---------------------------------------------------------------------------

qqnorm(residuals(lm.fit1))
qqline(residuals(lm.fit1), col="red")

shapiro.test(residuals(lm.fit1))
# --> the p value is > 0.05 so Ho cannot be rejected. The residuals 
#     distribution is normal.
# --> normality of residuals is an assumption of the linear model.
#     this means that the chosen model works correctly.

# ---------------------------------------------------------------------------
# EVALUATE THE QUALITY OF THE MODEL
# MODELİN KALİTESİNİ DEĞERLENDİRME
# ---------------------------------------------------------------------------

# create a random training and a testing set
# rastgele bir eğitim ve test seti oluşturma
set.seed(1)
row.number <- sample(1:nrow(data), 0.8*nrow(data))

train <- data[row.number,]
test <- data[-row.number,]

# estimate the linear fit with the training set
# eğitim setiyle doğrusal uyumu tahmin etme
lm.fit0.8 <- lm(Yearly.Amount.Spent~Length.of.Membership, data=train)
summary(lm.fit0.8)

# predict on testing set
# test setinde tahmin yapma
prediction0.8 <- predict(lm.fit0.8, newdata = test)
err0.8 <- prediction0.8 - test$Yearly.Amount.Spent
rmse <- sqrt(mean(err0.8^2))
mape <- mean(abs(err0.8/test$Yearly.Amount.Spent))

c(RMSE=rmse,mape=mape,R2=summary(lm.fit0.8)$r.squared) # to print the 3 parameters

# ---------------------------------------------------------------------------
# MULTIPLE REGRESSION
# ÇOKLU REGRESYON
# ---------------------------------------------------------------------------
attach(data)
lm.fit <- lm(Yearly.Amount.Spent~Avg..Session.Length +
                                    Time.on.App + 
                                    Time.on.Website +
                                    Length.of.Membership)

summary(lm.fit)

# --------------
# findings :
# 3 of the 4 variables studied seem to have an positive impact on the
# response variable. the most important remains length of membership, with 
# a coefficient 1.5 and 2.4 higher than Time on App and Avg Session Length 
# respectively. 
# Time on website seems to have little impact in the response. 

# --------------
# findings :
# 4 değişkenin 3'ü, yanıt değişkeni üzerinde olumlu bir etkiye sahip gibi görünüyor. En önemli olan üyelik süresidir ve bu, Time on App ve Avg Session Length'den sırasıyla 1.5 ve 2.4 daha yüksek bir katsayıya sahiptir. 
# Time on Website ise yanıt üzerinde çok az etkiye sahip görünmektedir.

# ---------------------------------------------------------------------------
# EVALUATE THE MULTIPLE REGRESSION MODEL
# ÇOKLU REGRESYON MODELİNİN DEĞERLENDİRİLMESİ
# ---------------------------------------------------------------------------

# create a random training and a testing set
set.seed(1)
row.number <- sample(1:nrow(data), 0.8*nrow(data))

train <- data[row.number,]
test <- data[-row.number,]

# estimate the linear fit with the training set
# eğitim seti ile doğrusal uyumu tahmin edin
multi.lm.fit0.8 <- lm(Yearly.Amount.Spent~Avg..Session.Length +
                        Time.on.App + 
                        Time.on.Website +
                        Length.of.Membership, 
                      data=train)
summary(multi.lm.fit0.8)

# predict on testing set
prediction.multi0.8 <- predict(multi.lm.fit0.8, newdata = test)
err0.8 <- prediction.multi0.8 - test$Yearly.Amount.Spent
rmse <- sqrt(mean(err0.8^2))
mape <- mean(abs(err0.8/test$Yearly.Amount.Spent))

c(RMSE=rmse,mape=mape,R2=summary(lm.fit0.8)$r.squared) # to print the 3 parameters

# --------
# findings
# Using the multi-linear model, we generated a much more accurate estimate of the response variable. The R2 value rose from 0.65 to 0.98 and the RSE fell from 47.14 to $9.97.
# Çoklu doğrusal model kullanarak, yanıt değişkeninin tahminini çok daha doğru bir şekilde oluşturduk. R2 değeri 0.65'ten 0.98'e yükseldi ve RSE değeri 47.14'ten 9.97 dolara düştü.


