import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.devtools.v85.animation.model.KeyframeStyle;

import java.time.Duration;
import java.util.Collections;
import java.util.List;

public class ru {
    public ChromeDriver driver;

    public void SettingDriver(){
       ChromeOptions options = new ChromeOptions();
        options.setExperimentalOption("excludeSwitches", Collections.singletonList("enable-automation"));
        options.addArguments("--disable-useAutomationExtension");
        options.addArguments("--disable-blink-features=AutomationControlled");
        WebDriverManager.chromedriver().setup();
        driver =  new ChromeDriver(options);
        driver.manage().window().maximize();
    }
    public void OpenDriver(String google ){

       driver.get(google);

    }
    public void OpenMail(String XpathInput,String mailURL,String mailLink){                            // почта:taskmail123456@mail.ru
        WebElement element1 = driver.findElement(By.xpath(XpathInput));// пароль:vsemprivet@12345671245etedgvg
        element1.sendKeys(mailURL, Keys.ENTER);
//xpath для поля войти //button[@class="resplash-btn resplash-btn_primary resplash-btn_mailbox-big svelte-1y37831"]
//xpath для FieldLogin //input[@name="username"]
//xpath для  FieldPassword //input[@name="password"]

        WebElement element2 = driver.findElement(By.xpath(mailLink));

        element2.click();
    }
    public void LogIn(String XpathLogin ,String Login ,String XpathPassword,String pass)  {

        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(4));


        WebElement FieldLogin = driver.findElement(By.xpath(XpathLogin));
        FieldLogin.click();
        FieldLogin.sendKeys(Login,Keys.ENTER);

        WebElement FieldPass = driver.findElement(By.xpath(XpathPassword));
        FieldPass.sendKeys(pass,Keys.ENTER);

    }
    public void SendMessage(String Exception,String SendMessage,String emailToSend,String email){
        try{

            WebElement message = driver.findElement(By.xpath(SendMessage));
            message.click();

            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(4));

            List<WebElement> EmailToSend = driver.findElements(By.cssSelector(emailToSend));

            EmailToSend.get(0).click();

            EmailToSend.get(0).sendKeys(email);

        }

        catch(Exception e){

            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(4));

            WebElement close = driver.findElement(By.xpath(Exception));
            close.click();

            WebElement message = driver.findElement(By.xpath(SendMessage));
            message.click();

            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));

            List<WebElement> EmailToSend = driver.findElements(By.cssSelector(emailToSend));//Здесь произошла ошибка

            EmailToSend.get(0).click();

            EmailToSend.get(0).sendKeys(email);
        }


    }
}
