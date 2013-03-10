import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableModel;

class GenerateTable extends JFrame {

	private	JPanel		topPanel;
	private	JTable		table;
	private	JScrollPane scrollPane;

	private JMenuBar menubar;
	private JMenu file;
	private JMenuItem export;
	
	
	public GenerateTable(ArrayList<Elective> electives){
		
		
		setTitle( "Basic Elective Recommendations" );
		setSize( 1200, 300 );
		setBackground( Color.gray );

		
		topPanel = new JPanel();
		topPanel.setLayout( new BorderLayout() );
		getContentPane().add( topPanel );

		// Create columns names
		String columnNames[] = { "CODE", "ELECTIVE", "STREAM","FULLTIME","PARTTIME","TYPE","PGMING","MODE","PREQS","FAVOUR" };

		// Create multidata array
		String[][] dataValues = new String[electives.size()][10];
		
		ArrayList<String> values = new ArrayList<String>();
		
		String[] valuesArray = new String[electives.size() * 10];
		
		// Store all data.
		for (Elective e: electives){
			values.add(e.getCode());
			values.add(e.getName());
			values.add(e.getStream());
			values.add(e.getSetf());
			values.add(e.getSetp());
			values.add(e.getType());
			values.add(e.getPrg());
			values.add(e.getMode());
			values.add(e.getPreq());
			values.add(e.getCf());
		}
		
		values.toArray(valuesArray);
		
		for (int i=0; i<electives.size(); i++){
			for (int j=0; j<10; j++){
				dataValues[i][j] = valuesArray[j + i*10];
			}
		}
		
		//Render cells. Optional
		BETableCellRenderer renderer = new BETableCellRenderer();
		
		// Create a new table instance
		table = new JTable( dataValues, columnNames );
		table.setDefaultRenderer(Object.class, renderer);
		
		table.getColumnModel().getColumn(1).setPreferredWidth(160);
		
		//table.getColumnModel().setColumnMargin(10);
		
		table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
		
		table.setBackground(Color.WHITE);
		// Add the table to a scrolling pane
		scrollPane = new JScrollPane( table );
		topPanel.add( scrollPane, BorderLayout.CENTER );
		
		//Header bold 
		JTableHeader header = table.getTableHeader();
		header.setFont(new Font("Serif", Font.BOLD, 15));
		
		
		/*=====================================*/
	      /* Create the menus and menu items   */
	      /*=====================================*/
	      menubar = new JMenuBar();
	      file = new JMenu("File");
	      file.setMnemonic(KeyEvent.VK_F);
	      
	      export = new JMenuItem("Export");
	      export.setMnemonic(KeyEvent.VK_E);
	      export.setToolTipText("Export for spreedsheet application");
	      export.addActionListener(new ActionListener() {
	          public void actionPerformed(ActionEvent event) {
	        	  JFileChooser jfc = new JFileChooser();
	        	  jfc.setDialogTitle("Specify a file to save.");
	        	  int userSelection = jfc.showSaveDialog(GenerateTable.this);
	        	  
	        	  if (userSelection == JFileChooser.APPROVE_OPTION){
	        		  File fileToSave = jfc.getSelectedFile();
	        		  System.out.println("Saving to " + fileToSave);
	        		  toExcel(table, fileToSave);
	        	  }
	          }

	      });
	      file.add(export);
	      menubar.add(file);
	      setJMenuBar(menubar);
		
		setLocationRelativeTo(null);
		
		setVisible(true);
		setResizable(false);
	}
	
	private void toExcel(JTable table, File file){
		try{
	        TableModel model = table.getModel();
	        PrintWriter excel = new PrintWriter(file);

	        // Column names
	        for(int i = 0; i < model.getColumnCount(); i++){
	            excel.write(model.getColumnName(i) + "\t");
	        }

	        excel.write("\n");

	        // Data sheet
	        for(int i=0; i< model.getRowCount(); i++) {
	            for(int j=0; j < model.getColumnCount(); j++) {
	                excel.write(model.getValueAt(i,j).toString()+"\t");
	            }
	            excel.write("\n");
	        }

	        excel.close();

	    }catch(IOException e){
	    	System.out.println(e); 
	    }
	}

	private class BETableCellRenderer extends DefaultTableCellRenderer{
		public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column){
			Component c = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column); 

			if (! table.isRowSelected(row))
			{
			    if( row % 2 == 0)
			        c.setBackground(Color.LIGHT_GRAY);
			    else
			        c.setBackground(table.getBackground());
			    if (column == 9 || column == 1)
			    	c.setBackground(Color.CYAN);
			}
			return c; 
		} 
	}
	
	
 }
	