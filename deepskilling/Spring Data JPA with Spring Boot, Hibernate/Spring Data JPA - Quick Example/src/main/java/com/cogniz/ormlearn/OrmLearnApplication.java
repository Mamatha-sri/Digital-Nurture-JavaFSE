package com.cogniz.ormlearn;
import com.cogniz.ormlearn.model.Country;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.cogniz.ormlearn.service.CountryService;

@SpringBootApplication
public class OrmLearnApplication implements CommandLineRunner {

    private final CountryService countryService;

    public OrmLearnApplication(CountryService countryService) {
        this.countryService = countryService;
    }

    public static void main(String[] args) {

        SpringApplication.run(OrmLearnApplication.class, args);

    }

    @Override
    public void run(String... args) {

        List<Country> countries = countryService.getAllCountries();

        System.out.println("Countries:");

        countries.forEach(System.out::println);

    }
}