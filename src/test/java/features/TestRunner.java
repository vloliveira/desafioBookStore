package features;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testeCriarUsuario() {
        return Karate.run(//"classpath:features/users/criarUsuario/criar-usuario-sucesso.feature",
                //"classpath:features/gerarToken/auth.feature",
                //"classpath:features/users/deletarUsuario/deletar-usuario.feature"
                "classpath:features/books/buscarLivros/buscar-livros.feature"
        ).relativeTo(TestRunner.class);
    }

}
