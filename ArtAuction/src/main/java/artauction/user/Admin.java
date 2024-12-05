package artauction.user;

public class Admin extends User {
    private String role;
    private String referralCode;
    private String referralCodeUsed;

    public Admin(int id, String name, String displayName, String emailAddress, String address, boolean anonymous, int profilePictureID, String role, String referralCode, String referralCodeUsed) {
        super(id, name, displayName, emailAddress, address, anonymous, profilePictureID);
        this.role = role;
        this.referralCode = referralCode;
        this.referralCodeUsed = referralCodeUsed;
    }

    public Admin(User user, String role, String referralCode, String referralCodeUsed) {
        this(user.getId(), user.getName(), user.getDisplayName(), user.getEmailAddress(), user.getAddress(), user.isAnonymous(), user.getProfilePictureID(), role, referralCode, referralCodeUsed);
    }

    public String getRole() {
        return this.role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getReferralCode() {
        return this.referralCode;
    }

    public void setReferralCode(String referralCode) {
        this.referralCode = referralCode;
    }

    public String getReferralCodeUsed() {
        return this.referralCodeUsed;
    }

    public void setReferralCodeUsed(String referralCodeUsed) {
        this.referralCodeUsed = referralCodeUsed;
    }
}
