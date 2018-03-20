import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Main {
	public static void main(String[] args) {
		frame f = new frame();
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    f.setVisible(true);
	}
	
	
}

class frame extends JFrame {
	private static final long serialVersionUID = 1L;
	public frame() {
		this.setSize(500, 220);
		JPanel p = new JPanel();
		JTextField vstup = new JTextField("vstup", 10);
		JTextField heslo = new JTextField("heslo", 10);
		JTextField vystup = new JTextField("vystup", 10);
		vstup.setSize(200, 200);
		JButton button1 = new JButton("Sifrovany");
		button1.addActionListener(new ActionListener() {
		     public void actionPerformed(ActionEvent e) {
		    	 try {
		    	 FileReader fr;
		    	 fr = new FileReader(vstup.getText());
		    	 int c;
		    	 String text = "";
		    	 while((c= fr.read())!=-1) {
		    		text = text + (char)c;
		    	 }
		    	 fr.close();
		    	 } catch(Exception k) {
		 			System.out.println("Problem");
		 	
		 		}
		     }
		});
	
		p.add(button1);
		p.add(vstup);
		p.add(heslo);
		p.add(vystup);
		add(p);
	} 
}
