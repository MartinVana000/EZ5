import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileReader;
import java.io.FileWriter;

import javax.swing.JButton;
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
		JTextField vstup2 = new JTextField("vystup - kam ulozit", 10);
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
		    	 System.out.print(text);
		    	 //////////////
		    	 	byte[] txt = text.getBytes();
		    	 	byte[] key = heslo.getText().getBytes();
		    		byte[] res = new byte[text.length()];
		    		for (int i = 0; i < txt.length; i++) {
		    			res[i] = (byte) (txt[i] ^ key[i % key.length]);
		    		}
		    		String text2 = new String(res);
		    		vystup.setText(text2);
		    		try {
				    FileWriter write = new FileWriter(vstup2.getText());
				    int c2;
				    while((c2 = fr.read())!=-1) {
				    	write.write(c2);
				    }
				    write.close();
		    		} catch(Exception t) {
		    			System.out.println("Problem");
		    	
		    		}
		    	 //////////////
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
