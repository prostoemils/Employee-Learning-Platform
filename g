package operation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertOperation {

	static Scanner scan = new Scanner(System.in);

	public void insert(Connection con, String table) {
		try {
			switch(table) {
				case "actor" -> insertActor(con);
				case "category" -> insertCategory(con);
				case "country" -> insertCountry(con);
				case "language" -> insertLanguage(con);
				case "city" -> insertCity(con);
				default -> System.out.println("Neatbalstita tabula: " + table);
			}

		} catch(SQLException e) {
			System.out.println("INSERT kluda: " + e.getMessage());

		} catch(NumberFormatException e) {
			System.out.println("Kluda: jaievada derigs skaitlis!");
		}
	}

	private void insertActor(Connection con) throws SQLException {
		System.out.println("Ievadi aktiera vardu:");
		String firstName = scan.nextLine().trim();

		System.out.println("Ievadi aktiera uzvardu:");
		String lastName = scan.nextLine().trim();

		String sql = "INSERT INTO actor(first_name, last_name) VALUES(?, ?)";

		try(PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, firstName);
			ps.setString(2, lastName);

			int rows = ps.executeUpdate();
			System.out.println("Actor tabula pievienotas " + rows + " rindas.");
		}
	}

	private void insertCategory(Connection con) throws SQLException {
		System.out.println("Ievadi kategorijas nosaukumu:");
		String name = scan.nextLine().trim();

		String sql = "INSERT INTO category(name) VALUES(?)";

		try(PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, name);

			int rows = ps.executeUpdate();
			System.out.println("Category tabula pievienotas " + rows + " rindas.");
		}
	}

	private void insertCountry(Connection con) throws SQLException {
		System.out.println("Ievadi valsts nosaukumu:");
		String country = scan.nextLine().trim();

		String sql = "INSERT INTO country(country) VALUES(?)";

		try(PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, country);

			int rows = ps.executeUpdate();
			System.out.println("Country tabula pievienotas " + rows + " rindas.");
		}
	}

	private void insertLanguage(Connection con) throws SQLException {
		System.out.println("Ievadi valodas nosaukumu:");
		String name = scan.nextLine().trim();

		String sql = "INSERT INTO language(name) VALUES(?)";

		try(PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, name);

			int rows = ps.executeUpdate();
			System.out.println("Language tabula pievienotas " + rows + " rindas.");
		}
	}

	private void insertCity(Connection con) throws SQLException {
		System.out.println("Ievadi pilsetas nosaukumu:");
		String city = scan.nextLine().trim();

		System.out.println("Ievadi Country ID:");
		int countryId = Integer.parseInt(scan.nextLine().trim());

		String sql = "INSERT INTO city(city, country_id) VALUES(?, ?)";

		try(PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, city);
			ps.setInt(2, countryId);

			int rows = ps.executeUpdate();
			System.out.println("City tabula pievienotas " + rows + " rindas.");
		}
	}
}