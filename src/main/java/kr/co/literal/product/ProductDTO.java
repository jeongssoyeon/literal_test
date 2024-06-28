package kr.co.literal.product;

public class ProductDTO {
    private String genre_code;
    private String book_code;
    private String book_number;
    private String book_title;
    private String author;
    private String book_detail;
    private String img;
    private int img_size;
    private int grade_code;
    private int original_price;
    private int sale_price;
    private String email;
    private int availability;
    
    public ProductDTO() {}

	public String getGenre_code() {
		return genre_code;
	}

	public void setGenre_code(String genre_code) {
		this.genre_code = genre_code;
	}

	public String getBook_code() {
		return book_code;
	}

	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}

	public String getBook_number() {
		return book_number;
	}

	public void setBook_number(String book_number) {
		this.book_number = book_number;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getBook_detail() {
		return book_detail;
	}

	public void setBook_detail(String book_detail) {
		this.book_detail = book_detail;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getImg_size() {
		return img_size;
	}

	public void setImg_size(int img_size) {
		this.img_size = img_size;
	}

	public int getGrade_code() {
		return grade_code;
	}

	public void setGrade_code(int grade_code) {
		this.grade_code = grade_code;
	}

	public int getOriginal_price() {
		return original_price;
	}

	public void setOriginal_price(int original_price) {
		this.original_price = original_price;
	}

	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAvailability() {
		return availability;
	}

	public void setAvailability(int availability) {
		this.availability = availability;
	}

	@Override
	public String toString() {
		return "ProductDTO [genre_code=" + genre_code + ", book_code=" + book_code + ", book_number=" + book_number
				+ ", book_title=" + book_title + ", author=" + author + ", book_detail=" + book_detail + ", img=" + img
				+ ", img_size=" + img_size + ", grade_code=" + grade_code + ", original_price=" + original_price
				+ ", sale_price=" + sale_price + ", email=" + email + ", availability=" + availability + "]";
	}
    
} // public class ProductDTO end
