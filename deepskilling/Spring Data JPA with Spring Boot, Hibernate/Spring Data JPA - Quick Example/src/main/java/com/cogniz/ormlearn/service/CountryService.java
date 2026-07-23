package com.cogniz.ormlearn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cogniz.ormlearn.model.Country;
import com.cogniz.ormlearn.repository.CountryRepository;

@Service
public class CountryService {

    @Autowired
    private CountryRepository repository;

    public List<Country> getAllCountries() {
        return repository.findAll();
    }
}