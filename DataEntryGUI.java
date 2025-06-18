package data;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DataEntryGUI extends JFrame {
    private JTextField eventNameField;
    private JTextField eventDateField;
    private JButton submitButton;

    public DataEntryGUI() {
        setTitle("Event Data Entry");
        setSize(400, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(3, 2));

        panel.add(new JLabel("Event Name:"));
        eventNameField = new JTextField();
        panel.add(eventNameField);

        panel.add(new JLabel("Event Date (YYYY-MM-DD):"));
        eventDateField = new JTextField();
        panel.add(eventDateField);

        submitButton = new JButton("Submit");
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                submitEventData();
            }
        });
        panel.add(submitButton);

        add(panel);
    }

    private void submitEventData() {
        String eventName = eventNameField.getText();
        String eventDate = eventDateField.getText();

        try {
            // Establishing a database connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EM", "root", "root");

            // Creating a PreparedStatement to insert data into the database
            String query = "INSERT INTO Events (EventName, Date) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, eventName);
            preparedStatement.setString(2, eventDate);

            // Executing the query
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                JOptionPane.showMessageDialog(this, "Event data submitted successfully.", "Success", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(this, "Failed to submit event data.", "Error", JOptionPane.ERROR_MESSAGE);
            }

            // Closing the connection and statement
            preparedStatement.close();
            connection.close();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error submitting event data: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new DataEntryGUI().setVisible(true);
            }
        });
    }
}
