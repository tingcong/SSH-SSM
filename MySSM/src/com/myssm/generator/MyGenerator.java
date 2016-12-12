package com.myssm.generator;

import java.awt.EventQueue;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Color;
import java.awt.Toolkit;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JLabel;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.xml.sax.SAXException;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JComboBox;

public class MyGenerator {

	private JFrame frame;
	private JTextField txtConn;
	private JTextField txtUser;
	private JTextField txtPwd;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MyGenerator window = new MyGenerator();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MyGenerator() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setResizable(false);
		frame.setBounds(100, 100, 1000, 488);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);

		JButton btnbean = new JButton("\u9009\u62E9bean\u8DEF\u5F84");
		btnbean.setBackground(Color.WHITE);
		btnbean.setForeground(new Color(250, 128, 114));
		btnbean.setFont(new Font("΢���ź�", Font.PLAIN, 16));
		btnbean.setBounds(14, 146, 299, 33);
		frame.getContentPane().add(btnbean);

		JButton btnmapper = new JButton("\u9009\u62E9mapper\u8DEF\u5F84");
		btnmapper.setBackground(Color.WHITE);
		btnmapper.setForeground(new Color(250, 128, 114));
		btnmapper.setFont(new Font("΢���ź�", Font.PLAIN, 16));
		btnmapper.setBounds(14, 223, 299, 33);
		frame.getContentPane().add(btnmapper);

		JButton btnmapperxml = new JButton("\u9009\u62E9mapper.xml\u8DEF\u5F84");
		btnmapperxml.setBackground(Color.WHITE);
		btnmapperxml.setForeground(new Color(250, 128, 114));
		btnmapperxml.setFont(new Font("΢���ź�", Font.PLAIN, 16));
		btnmapperxml.setBounds(14, 300, 299, 33);
		frame.getContentPane().add(btnmapperxml);

		final JLabel lblBeanDir = new JLabel("bean-dir");
		lblBeanDir.setFont(new Font("΢���ź�", Font.BOLD, 15));
		lblBeanDir.setBounds(14, 192, 921, 18);
		frame.getContentPane().add(lblBeanDir);

		final JLabel lblMapperdir = new JLabel("mapper-dir");
		lblMapperdir.setFont(new Font("΢���ź�", Font.BOLD, 15));
		lblMapperdir.setBounds(14, 269, 921, 18);
		frame.getContentPane().add(lblMapperdir);

		final JLabel lblMapperxmldir = new JLabel("mapperxml-dir");
		lblMapperxmldir.setFont(new Font("΢���ź�", Font.BOLD, 15));
		lblMapperxmldir.setBounds(14, 346, 921, 18);
		frame.getContentPane().add(lblMapperxmldir);

		JButton btnGenerate = new JButton(
				"\u4E00\u952E\u751F\u6210bean/mapper/mapper.xml");
		btnGenerate.setBackground(Color.WHITE);
		btnGenerate.setForeground(new Color(250, 128, 114));
		btnGenerate.setFont(new Font("΢���ź�", Font.BOLD, 18));
		btnGenerate.setBounds(14, 400, 966, 39);
		frame.getContentPane().add(btnGenerate);

		JLabel lblTitle = new JLabel(
				"MySSM\u5FEB\u901F\u5F00\u53D1\u6846\u67B6");
		lblTitle.setForeground(new Color(250, 128, 114));
		lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lblTitle.setFont(new Font("΢���ź�", Font.BOLD, 18));
		lblTitle.setBounds(14, 13, 966, 25);
		frame.getContentPane().add(lblTitle);

		JLabel lblConn = new JLabel(
				"\u6570\u636E\u5E93\u8FDE\u63A5eg.127.0.0.1:3306");
		lblConn.setFont(new Font("΢���ź�", Font.BOLD, 15));
		lblConn.setBounds(14, 51, 320, 18);
		frame.getContentPane().add(lblConn);

		txtConn = new JTextField();
		txtConn.setHorizontalAlignment(SwingConstants.CENTER);
		txtConn.setText("127.0.0.1:3306");
		txtConn.setFont(new Font("΢���ź�", Font.BOLD, 14));
		txtConn.setBounds(14, 82, 212, 33);
		frame.getContentPane().add(txtConn);
		txtConn.setColumns(10);

		final JComboBox<String> cmbConn = new JComboBox<String>();
		cmbConn.setFont(new Font("΢���ź�", Font.PLAIN, 14));
		cmbConn.setBackground(Color.WHITE);
		cmbConn.setBounds(658, 82, 180, 33);
		frame.getContentPane().add(cmbConn);

		JButton btnConn = new JButton("\u4FDD\u5B58\u8FDE\u63A5");
		btnConn.setForeground(new Color(250, 128, 114));
		btnConn.setFont(new Font("΢���ź�", Font.PLAIN, 16));
		btnConn.setBackground(Color.WHITE);
		btnConn.setBounds(852, 82, 128, 33);
		frame.getContentPane().add(btnConn);

		txtUser = new JTextField();
		txtUser.setHorizontalAlignment(SwingConstants.CENTER);
		txtUser.setText("root");
		txtUser.setFont(new Font("΢���ź�", Font.BOLD, 14));
		txtUser.setColumns(10);
		txtUser.setBounds(240, 82, 200, 33);
		frame.getContentPane().add(txtUser);

		txtPwd = new JTextField();
		txtPwd.setHorizontalAlignment(SwingConstants.CENTER);
		txtPwd.setText("root");
		txtPwd.setFont(new Font("΢���ź�", Font.BOLD, 14));
		txtPwd.setColumns(10);
		txtPwd.setBounds(444, 82, 200, 33);
		frame.getContentPane().add(txtPwd);

		JLabel lblUserInfo = new JLabel(
				"\u6570\u636E\u5E93\u7528\u6237\u540D/\u5BC6\u7801");
		lblUserInfo.setFont(new Font("΢���ź�", Font.BOLD, 15));
		lblUserInfo.setBounds(348, 51, 338, 18);
		frame.getContentPane().add(lblUserInfo);

		JLabel label = new JLabel("\u6570\u636E\u5E93\u540D\u5217\u8868");
		label.setFont(new Font("΢���ź�", Font.BOLD, 15));
		label.setBounds(700, 51, 280, 18);
		frame.getContentPane().add(label);

		// bean·��ѡ��
		btnbean.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JFileChooser dlg = new JFileChooser();
				dlg.setCurrentDirectory(new File(System.getProperty("user.dir")
						+ "\\src"));
				dlg.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				int opt = dlg.showOpenDialog(null);

				// ��ȡѡ���·��
				if (opt == JFileChooser.CANCEL_OPTION)
					return;
				if (dlg.getSelectedFile() == null)
					return;
				if (!dlg.getSelectedFile().getPath().contains("\\src\\")) {
					JOptionPane.showMessageDialog(null, "·������/src/���Ϸ�");
					return;
				}
				String beanDir = dlg.getSelectedFile().getPath();
				lblBeanDir.setText(beanDir);

				// ����conf
				try {
					setConfDir("javaModelGenerator", beanDir);
				} catch (DocumentException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (SAXException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		// mapper�ӿ�·��ѡ��
		btnmapper.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JFileChooser dlg = new JFileChooser();
				dlg.setCurrentDirectory(new File(System.getProperty("user.dir")
						+ "\\src"));
				dlg.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				int opt = dlg.showOpenDialog(null);

				// ��ȡѡ���·��
				if (opt == JFileChooser.CANCEL_OPTION)
					return;
				if (dlg.getSelectedFile() == null)
					return;
				if (!dlg.getSelectedFile().getPath().contains("\\src\\")) {
					JOptionPane.showMessageDialog(null, "·������/src/���Ϸ�");
					return;
				}
				String mapperDir = dlg.getSelectedFile().getPath();
				lblMapperdir.setText(mapperDir);

				// ����conf
				try {
					setConfDir("javaClientGenerator", mapperDir);
				} catch (DocumentException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (SAXException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		// mapper.xml·��ѡ��
		btnmapperxml.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JFileChooser dlg = new JFileChooser();
				dlg.setCurrentDirectory(new File(System.getProperty("user.dir")
						+ "\\src"));
				dlg.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				int opt = dlg.showOpenDialog(null);

				// ��ȡѡ���·��
				if (opt == JFileChooser.CANCEL_OPTION)
					return;
				if (dlg.getSelectedFile() == null)
					return;
				if (!dlg.getSelectedFile().getPath().contains("\\src\\")) {
					JOptionPane.showMessageDialog(null, "·������/src/���Ϸ�");
					return;
				}
				String mapperXmlDir = dlg.getSelectedFile().getPath();
				lblMapperxmldir.setText(mapperXmlDir);

				// ����conf
				try {
					setConfDir("sqlMapGenerator", mapperXmlDir);
				} catch (DocumentException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (SAXException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		// һ�����ɴ���
		btnGenerate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					generate();
					clearFile();
					JOptionPane.showMessageDialog(null, "���ɳɹ���");
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(null,
							"IOException/����ʧ��/����������д");
					return;
				} catch (XMLParserException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(null,
							"XMLParserException/����ʧ��/����������д");
					return;
				} catch (InvalidConfigurationException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(null,
							"InvalidConfigurationException/����ʧ��/����������д");
					return;
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(null,
							"SQLException/����ʧ��/����������д");
					return;
				} catch (InterruptedException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(null,
							"InterruptedException/����ʧ��/����������д");
					return;
				} catch (SAXException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(null,
							"SAXException/����ʧ��/����������д");
					return;
				} catch (DocumentException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(null,
							"DocumentException/����ʧ��/����������д");
					return;
				}
			}
		});

		// database�����б�-����¼�
		cmbConn.addMouseListener(new MouseListener() {

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// ��ȡ��д��url/username/password
				String url = "jdbc:mysql://" + txtConn.getText().trim();
				String username = txtUser.getText().trim();
				String password = txtPwd.getText().trim();

				// ��ȡJdbcTemplate
				DriverManagerDataSource ds = new DriverManagerDataSource(url,
						username, password);
				JdbcTemplate tplt = new JdbcTemplate(ds);

				// ��ȡ���ݿ����б�
				List<String> databases = new ArrayList<String>();
				try {
					databases = tplt.queryForList("show DATABASES",
							String.class);
				} catch (Exception ee) {
					JOptionPane.showMessageDialog(null, "�����ַ���/�û���/���� ����ȷ");
					return;
				}

				// �����ݿ����б�
				cmbConn.removeAllItems();
				for (String database : databases)
					cmbConn.addItem(database);
			}
		});

		// ��������
		btnConn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// ���ݿ���δѡȡ
				if (cmbConn.getSelectedItem() == null) {
					JOptionPane.showMessageDialog(null, "���ݿ���δѡȡ");
					return;
				}

				// ��ȡ��д��url/username/password
				String url = "jdbc:mysql://" + txtConn.getText().trim();
				String username = txtUser.getText().trim();
				String password = txtPwd.getText().trim();

				// ��ȡ����connstr
				String connstr = url + "/"
						+ cmbConn.getSelectedItem().toString().trim();

				// ���浽conf
				try {
					setConfConn(connstr, username, password);
					JOptionPane.showMessageDialog(null, "�����������");
				} catch (SAXException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (DocumentException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		// ��������conf.xml/��ʾ���ѡ��
		loadConf(lblBeanDir, lblMapperdir, lblMapperxmldir, cmbConn);
		// ��Ļ������ʾ
		setLocationCenter(frame);

	}

	// ������������
	private void loadConf(JLabel lblBeanDir, JLabel lblMapperdir,
			JLabel lblMapperxmldir, JComboBox<String> cmbConn) {
		// ��������conf.xml/��ʾ���ѡ��
		try {
			// ����beanDir
			Element elmtBean = getConfElmt("javaModelGenerator");
			String beanDir = elmtBean.attribute("targetProject").getValue()
					+ "\\"
					+ elmtBean.attribute("targetPackage").getValue()
							.replace(".", "\\");
			lblBeanDir.setText(beanDir);

			// ����mapper·��
			Element elmtMapper = getConfElmt("javaClientGenerator");
			String mapperDir = elmtMapper.attribute("targetProject").getValue()
					+ "\\"
					+ elmtMapper.attribute("targetPackage").getValue()
							.replace(".", "\\");
			lblMapperdir.setText(mapperDir);

			// ����mapper.xml·��
			Element elmtMapperXml = getConfElmt("sqlMapGenerator");
			String mapperXmlDir = elmtMapperXml.attribute("targetProject")
					.getValue()
					+ "\\"
					+ elmtMapperXml.attribute("targetPackage").getValue()
							.replace(".", "\\");
			lblMapperxmldir.setText(mapperXmlDir);

			// ����conn
			Element elmtConn = getConfElmt("jdbcConnection");
			String connstr = elmtConn.attribute("connectionURL").getValue()
					.trim();
			// connstrΪ��ʱȡĬ��ֵ(jdbc:mysql://127.0.0.1:3306/test)
			if (connstr.equals(""))
				connstr = "jdbc:mysql://127.0.0.1:3306/test";
			String[] strs = connstr.replace("//", "/").split("/");

			// ��ȡip_port/username/password
			String ip_port = strs[1].trim();
			String database = strs[2].trim();
			String username = elmtConn.attribute("userId").getValue();
			String password = elmtConn.attribute("password").getValue();

			// ��ʾ���ؼ�
			txtConn.setText(ip_port);
			txtUser.setText(username);
			txtPwd.setText(password);
			cmbConn.addItem(database);
			cmbConn.setSelectedItem(database);

		} catch (SAXException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	// ��ȡconfָ���ڵ�
	private Element getConfElmt(String node) throws SAXException,
			DocumentException {
		// ��ȡnode�ڵ�
		SAXReader sax = new SAXReader(false);
		sax.setFeature(
				"http://apache.org/xml/features/nonvalidating/load-external-dtd",
				false);
		Document doc = sax.read(MyGenerator.class
				.getResourceAsStream("generatorConfig.xml"));
		Element elmt = (Element) doc.selectSingleNode("//context/" + node);
		return elmt;
	}

	// ��дconf-dir
	private void setConfDir(String node, String dir) throws DocumentException,
			IOException, SAXException {
		// ��ȡnode�ڵ�
		SAXReader sax = new SAXReader(false);
		sax.setFeature(
				"http://apache.org/xml/features/nonvalidating/load-external-dtd",
				false);
		Document doc = sax.read(MyGenerator.class
				.getResourceAsStream("generatorConfig.xml"));
		Element elmt = (Element) doc.selectSingleNode("//context/" + node);

		// ���·���Ͱ���
		String[] arr = dir.split("\\\\src\\\\");
		String path = arr[0] + "\\src";
		String pack = arr[1].replace("\\", ".");

		// ��д·���Ͱ���
		elmt.attribute("targetProject").setValue(path);
		elmt.attribute("targetPackage").setValue(pack);

		// ����genconf.xml
		// ���浽Դ����
		String genpack = MyGenerator.class.getPackage().getName()
				.replace(".", "/");
		XMLWriter writer1 = new XMLWriter(new FileOutputStream(new File("src/"
				+ genpack + "/generatorConfig.xml")));

		// ���浽classes
		XMLWriter writer2 = new XMLWriter(new FileOutputStream(new File(
				MyGenerator.class.getResource("generatorConfig.xml").getPath()
						.replace("%20", " "))));

		writer1.write(doc);
		writer2.write(doc);
	}

	// ��дconf-conn
	private void setConfConn(String connstr, String username, String password)
			throws SAXException, DocumentException, IOException {
		// ��ȡnode�ڵ�
		SAXReader sax = new SAXReader(false);
		sax.setFeature(
				"http://apache.org/xml/features/nonvalidating/load-external-dtd",
				false);
		Document doc = sax.read(MyGenerator.class
				.getResourceAsStream("generatorConfig.xml"));
		Element elmt = (Element) doc
				.selectSingleNode("//context/jdbcConnection");

		// ��дconnstr
		elmt.attribute("connectionURL").setValue(connstr);
		// ��дusername/password
		elmt.attribute("userId").setValue(username);
		elmt.attribute("password").setValue(password);

		// ����genconf.xml
		// ���浽Դ����
		String genpack = MyGenerator.class.getPackage().getName()
				.replace(".", "/");
		XMLWriter writer1 = new XMLWriter(new FileOutputStream(new File("src/"
				+ genpack + "/generatorConfig.xml")));

		// ���浽classes
		XMLWriter writer2 = new XMLWriter(new FileOutputStream(new File(
				MyGenerator.class.getResource("generatorConfig.xml").getPath()
						.replace("%20", " "))));

		writer1.write(doc);
		writer2.write(doc);
	}

	// ����conf����bean/mapper/mapper.xml
	private void generate() throws IOException, XMLParserException,
			InvalidConfigurationException, SQLException, InterruptedException {
		List<String> warnings = new ArrayList<String>();
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(MyGenerator.class
				.getResourceAsStream("generatorConfig.xml"));
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
				new DefaultShellCallback(false), warnings);
		myBatisGenerator.generate(null);
	}

	// ��ȡָ���ڵ�����·��
	private String getFullPath(String node) throws SAXException,
			DocumentException {
		Element elmtBean = getConfElmt(node);
		String pack = elmtBean.attribute("targetPackage").getValue();
		String path = elmtBean.attribute("targetProject").getValue();
		return path + "\\" + pack.replace(".", "\\");
	}

	// ����ָ��·���¶����ļ�
	private void clearFileByDir(String path) {
		// ����·���·�.java/.xml�ļ�
		File dir = new File(path);
		File[] files = dir.listFiles();

		// ����ɾ��
		for (File file : files) {
			if (!file.getName().endsWith(".java")
					&& !file.getName().endsWith(".xml"))
				file.delete();
		}

	}

	// ��������ļ�
	private void clearFile() throws SAXException, DocumentException {
		// ��ȡbean/mapper/mapper.xml����·��
		String pathBean = getFullPath("javaModelGenerator");
		String pathMapper = getFullPath("javaClientGenerator");
		String pathMapperXml = getFullPath("sqlMapGenerator");

		// ����
		clearFileByDir(pathBean);
		clearFileByDir(pathMapper);
		clearFileByDir(pathMapperXml);
	}

	// ��Ļ������ʾ
	private void setLocationCenter(JFrame frame) {
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		Dimension compSize = frame.getSize();
		if (compSize.height > screenSize.height) {
			compSize.height = screenSize.height;
		}
		if (compSize.width > screenSize.width) {
			compSize.width = screenSize.width;
		}
		frame.setLocation((screenSize.width - compSize.width) / 2,
				(screenSize.height - compSize.height) / 2);
	}
}
