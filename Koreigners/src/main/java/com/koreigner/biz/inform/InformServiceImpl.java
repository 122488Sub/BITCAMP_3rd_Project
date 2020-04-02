package com.koreigner.biz.inform;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


//@Service : @Component 상속바아 만든
//비즈니스 로직 처리 서비스 영역에 사용
@Service("informService")
public class InformServiceImpl implements InformService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private Korea_Address_DAOSpring testDAO;
	private InformDAO informDAO;

	@Override
	public int informSearchTotal(InformVO informVO) {
		return informDAO.dao_informSearchTotal(informVO);
	}

	@Override
	public List<Map<String, Object>> getSelectSearchList(InformVO informVO) {
		// TODO Auto-generated method stub
		return informDAO.dao_getSelectSearchList(informVO);
	}
	
	@Override
	public int insertInform(InformVO informVO) {
		return informDAO.dao_insertInform(informVO);
	}
	
	@Override
	public InformVO getInform(int info_idx) {
		
		return informDAO.dao_getInform(info_idx);
	}

	
	@Override
	public boolean nioFileCopy(String inFileName, String outFileName) {
        Path source = Paths.get(inFileName);
        Path target = Paths.get(outFileName);
        
		
        // 사전체크
        if (source == null) {
        
            throw new IllegalArgumentException("source must be specified");
        }
        if (target == null) {
        	
            throw new IllegalArgumentException("target must be specified");
        }
        
        // 소스파일이 실제로 존재하는지 체크
        if (!Files.exists(source, new LinkOption[] {})) {
        
            throw new IllegalArgumentException("Source file doesn't exist: " + source.toString());
        }
 
        /* // 소스경로와 복사후 경로가 일치하면 리턴 (일단 주석처리)
        if (source == target) {
            return;
        }
        */
        if (!new File(outFileName).isDirectory()) {
			new File(outFileName).mkdirs();
		}
        try {
       
            Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING);   // 파일복사
            
        } catch (IOException e) {
      
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        
        if(Files.exists(target, new LinkOption[]{})){        // 파일이 정상적으로 생성이 되었다면
            // System.out.println("File Copied");
            return true;                                     // true 리턴
        } else {
            System.out.println("File Copy Failed");
            return false;                                    // 실패시 false
        }
    }

	@Override
	public int updateInform(InformVO informVO) {
		System.out.println(informVO);
		return informDAO.dao_updateInform(informVO);
	}

	@Override
	public int increaseHit(int info_idx) {
		return informDAO.dao_increaseHit(info_idx);
	}

	@Override
	public int deleteInform(int info_idx) {
		return informDAO.dao_deleteInform(info_idx);
	}

	@Override
	public List<Map<String, Object>> getInformCategoryCount() {
		
		return informDAO.dao_getInformCategoryCount();
	}

	
	
	
}