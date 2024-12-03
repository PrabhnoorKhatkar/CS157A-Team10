package artauction.user;

public class User {
    private int id;
    private String name;
    private String displayName;
    private String password;
    private String emailAddress;
    private String address;
    private boolean anonymous;
    private int profilePictureID;
    public User(int id, String name, String displayName, String emailAddress, String address,
                boolean anonymous, int profilePictureID) {
        // for storing in session, no need for password
        this(name, displayName);
        this.id = id;
        this.emailAddress = emailAddress;
        this.address = address;
        this.anonymous = anonymous;
        this.profilePictureID = profilePictureID;
    }
    public User(String name, String displayName, String password, String emailAddress, String address,
                boolean anonymous) {
        // for registration
        this(name, displayName);
        this.password = password;
        this.emailAddress = emailAddress;
        this.address = address;
        this.anonymous = anonymous;
    }

    public User(String name, String displayName) {
        this(displayName);
        this.name = name;
    }

    public User(String displayName) {
        this.displayName = displayName;
    }

    public User() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isAnonymous() {
        return anonymous;
    }

    public void setAnonymous(boolean anonymous) {
        this.anonymous = anonymous;
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

    public int getProfilePictureID() {
        return profilePictureID;
    }

    public void setProfilePictureID(int profilePictureID) {
        this.profilePictureID = profilePictureID;
    }
}