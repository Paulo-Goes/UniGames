import java.sql.*;
import java.util.List;

public class ClienteService {

    private ClienteRepository clienteRepository = new ClienteRepository();

    public void addCliente(String nome, Sexo sexo, int idade, Date nascimento) {
        clienteRepository.addCliente(nome, sexo, idade, nascimento);
    }

    public Cliente getClienteById(int id) {
        return clienteRepository.getClienteById(id);
    }

    public List<Cliente> getAllClientes() {
        return clienteRepository.getAllClientes();
    }

    public void deleteCliente(int id) {
        clienteRepository.deleteCliente(id);
    }
}
