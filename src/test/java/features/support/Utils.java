package features.support;


import com.github.javafaker.Faker;

import java.util.Locale;

public class Utils {
    private static final Faker faker = new Faker(new Locale("pt-BR"));
    public static String gerarNome(){
        return faker.name().fullName();
    }
}
