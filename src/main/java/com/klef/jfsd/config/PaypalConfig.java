package com.klef.jfsd.config;

import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class PaypalConfig {

    private String clientId = "ASs9KI2O_eXPNM-XVhtB18CTPPrlhVSP8dNdHDhOQrV01ou7JO7yWXSilrstIEk-wgE3_odfy--wMBbS";
    private String clientSecret = "EPqZIDoBWvTzcX16faHU2qZcfDgwnFxvWRJnn1WprjI99vDsru5e23aYp8HKCcN2YSzrI6gJthC5FsDy";
    private String mode = "sandbox"; // or "live"

    @Bean
    public Map<String, String> paypalSdkConfig() {
        Map<String, String> configMap = new HashMap<>();
        configMap.put("mode", mode);
        return configMap;
    }

    @Bean
    public OAuthTokenCredential authTokenCredential() {
        return new OAuthTokenCredential(clientId, clientSecret, paypalSdkConfig());
    }

    @Bean
    public APIContext apiContext() throws PayPalRESTException {
        APIContext context = new APIContext(authTokenCredential().getAccessToken());
        context.setConfigurationMap(paypalSdkConfig());
        return context;
    }
}
