package com.example.spring.security.oauth2login;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(properties = {
        "spring.security.oauth2.client.registration.github.clientId=test",
        "spring.security.oauth2.client.registration.github.clientSecret=test"
})
class ApplicationTests {

    @Test
    void contextLoads() {
    }

}
