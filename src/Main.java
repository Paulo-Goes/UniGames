public class Main {
    public static void main(String[] args) {
        ClienteService clienteService = new ClienteService();

        clienteService.addCliente("Bone Lira", Sexo.M, 23, java.sql.Date.valueOf("2001-01-01"));
    }
}
