import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

import CLIPSJNI.*;

public class Profile extends JFrame{

	private JPanel panel;
	private JLabel type;
	private JLabel branch;
	
	private JComboBox ctype;
	private JComboBox cbranch;
	
	private JButton submit;
	
	String[] ynm;
	String[] yn;
	
	private Environment clips;
	boolean isExecuting = false;
	Thread executionThread;
	
	public Profile(){
		
        
		final String[] yn = {"Yes", "No"};
		final String[] ynm = {"Yes", "No", "Maybe"};
		
		type = new JLabel("Fulltime?");
		branch = new JLabel("KE?");
		
		ctype = new JComboBox(yn);
		cbranch = new JComboBox(yn);
		
		submit = new JButton("Submit");
		
		submit.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent arg0) {
				
				System.out.println("Button clicked!");
				
				String item = yn[cbranch.getSelectedIndex()];
				System.out.println("Item is " + item);
				
				if (item.equalsIgnoreCase("Yes")){
					
					System.out.println("(assert (electivewg (code 0) (name 4) (cf 0.9)))");
					clips.eval("(assert (electivewg (code 0) (name 4) (cf 0.9)))");
					runAuto();
				}
				
				
				try {
					int i = getSubject();
					i =  getSubject();
					System.out.println("Subject is " + i);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
		});
		
		panel = new JPanel();
		panel.setLayout(new GridLayout(3,2,20,20));
		panel.setBorder(BorderFactory.createEmptyBorder(5,5,5,5));
		
		panel.add(type);
		panel.add(ctype);
		
		panel.add(branch);
		panel.add(cbranch);
		
		panel.add(submit);
		
		add(panel);
		setTitle("Profiling");
		setSize(350,300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
	
		clips = new Environment();
	      
        clips.load("electives.clp");
        clips.reset();
        
        runAuto();
        System.out.println(clips.eval("(facts)"));		
	}
	
	   public void runAuto()
	     {
	      Runnable runThread = 
	         new Runnable()
	           {
	            public void run()
	              {
	               clips.run();
	              }
	           };
	      
	      isExecuting = true;
	      
	      executionThread = new Thread(runThread);
	      
	      executionThread.start();
	     }
	
	public int getSubject() throws Exception{

		int cname = 0;
		float cfvalue;
		PrimitiveValue pv, fv = null;
	
		String evalStr = "(getSubject)";
		
		pv = clips.eval(evalStr);
		
		
		 fv = pv.get(0);
         cname = fv.getFactSlot("name").intValue();
         cfvalue = fv.getFactSlot("cf").floatValue();
         //System.out.println("Subject name " + cname + " cf " + cfvalue);
        
        //System.out.println(clips.eval("(facts)"));
        
        return cname;
	}
	
	
	public static void main(String[] args){
		SwingUtilities.invokeLater(new Runnable(){
			public void run(){
				Profile profile = new Profile();
				profile.setVisible(true);
			}
		});
	}
	
}
