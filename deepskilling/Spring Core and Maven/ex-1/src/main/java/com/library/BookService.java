package com.library;

public class BookService {

    private BookRepository repository;

    public void setRepository(BookRepository repository) {
        this.repository = repository;
    }

    public void displayService() {

        System.out.println("Book Service is working...");

        repository.displayRepository();

    }

}