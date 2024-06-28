package kr.co.literal.product;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/product")
public class ProductCont {
	public ProductCont()
	{
		System.out.println("---- ProductCont() 객체 생성");
	} // public ProductCont() end
	
	@Autowired
	private ProductDAO productDao;
	
	//결과확인
	//-> http://localhost:8080/product/list

	@RequestMapping("/productlist")
	public ModelAndView productlist() {
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("/product/productlist");
	   return mav;
	 } // list() end
	
	
	@GetMapping("/productwrite")
	public String prductwrite() 
	{
		return "product/productwrite";
	} // public String write() end
	
	
	@PostMapping("/insert")
	public String insert (@RequestParam Map<String, Object> map, @RequestParam("img") MultipartFile img, HttpServletRequest req)
	{
		// 이미지 파일 저장 폴더의 실제 물리적인 경로 가져오기
	    ServletContext application = req.getServletContext();
	    String imageBasePath = application.getRealPath("/storage/images");
	    //String previewBasePath = application.getRealPath("/storage/previews");
		
		// 업로드 파일은 /storage 폴더에 저장
		String img_name = "-";
		long img_size= 0;
		if (img.getSize()>0 && img!=null && !img.isEmpty())			// 파일이 존재한다면
		{	img_size = img.getSize();
			// 전송된 파일이 /storage 파일에 존재한다면 파일명 리네임 후 filename 변수에 저장 / spring05_mymelon 참조
			try
			{
				String o_poster = img.getOriginalFilename();
				img_name = o_poster;
				
				File file = new File(imageBasePath, o_poster);	// 파일클래스에 해당 파일 담기
				
				int i = 1;
				while (file.exists()) 		// 파일이 존재한다면 
				{
					int lastDot = o_poster.lastIndexOf(".");
					img_name = o_poster.substring(0, lastDot) + "_" + i + o_poster.substring(lastDot);	// sky_1.png
					file = new File(imageBasePath, img_name);
					i++;
				} // while end
				
				img.transferTo(file);	// 파일 저장		
			} catch (Exception e)
			{
				System.out.println(e);
			}		
		} // if end
		
		map.put("img", img_name);
		map.put("img_size", img_size);

		
        // 업로드 파일은 /storage 폴더에 저장
/*        String preview_name = "-";
        long preview_size = 0;
        if (preview != null && !preview.isEmpty()) {
            preview_size = preview.getSize();
            try {
                String o_poster = preview.getOriginalFilename();
                preview_name = o_poster;
                File file = new File(previewBasePath, o_poster);
                int i = 1;
                while (file.exists()) {
                    int lastDot = o_poster.lastIndexOf(".");
                    preview_name = o_poster.substring(0, lastDot) + "_" + i + o_poster.substring(lastDot);
                    file = new File(previewBasePath, preview_name);
                    i++;
                }
                preview.transferTo(file);  // 파일 저장
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        map.put("preview_name", preview_name);
        map.put("preview_size", preview_size);
*/        
	    // genre_code로 book_code와 book_number 생성
	    String genreCode = (String) map.get("genre_code");
	    String bookCode = generateBookCode(genreCode);
	    String bookNumber = generateBookNumber(genreCode, bookCode);
	    map.put("book_code", bookCode);
	    map.put("book_number", bookNumber);
	    
		productDao.insert(map);
		
		return "redirect:/product/productlist";
	} // public String insert end

	
	private String generateBookCode(String genreCode) // book_code 생성 로직 (예: G-00001)
	{
	    int codeNumber = productDao.generateBookCode(genreCode); // 다음 책 번호
	    return genreCode + "-" + String.format("%05d", codeNumber); // 번호는 5자리 숫자
	}

	
	private String generateBookNumber(String genreCode, String bookCode) // book_number 생성 로직 (예: G-00001001) 
	{
	    int number = productDao.getNextBookNumber(genreCode, bookCode); //  주어진 장르 코드와 책 코드에 대한 다음 책 번호
	    return bookCode + String.format("%03d", number); // 번호는 3자리 숫자
	}
	
	
	

	
} // public class ProductCont end