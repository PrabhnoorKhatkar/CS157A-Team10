public class User 
{
	private String name;
	private String displayName;
	private String password;
	private String emailAddress;
	private String address;
	private boolean anonymous;

	public User(String name, String displayName, String password, String emailAddress, String address,
			boolean anonymous) {
		super();
		this.name = name;
		this.displayName = displayName;
		this.password = password;
		this.emailAddress = emailAddress;
		this.address = address;
		this.anonymous = anonymous;
	}

	public boolean isAnonymous() {
		return anonymous;
	}

	public void setAnonymous(boolean anonymous) {
		this.anonymous = anonymous;
	}

	public User() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	


}