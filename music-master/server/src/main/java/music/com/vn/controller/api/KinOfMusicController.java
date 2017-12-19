package music.com.vn.controller.api;

import music.com.vn.dto.KindOfMusicDTO;
import music.com.vn.service.KindOfMusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

public class KinOfMusicController {
	@Autowired
	KindOfMusicService KindOfMusicservice;

	@PostMapping("/apitest/kind-of-music")
	public ResponseEntity<KindOfMusicDTO> create(@RequestBody KindOfMusicDTO KindOfMusic) {
		KindOfMusicDTO KindOfMusicdto = KindOfMusicservice.save(KindOfMusic);
		return ResponseEntity.ok(KindOfMusicdto);
	}

	@PutMapping(value = "/apitest/kind-of-music/{id}")
	public ResponseEntity<KindOfMusicDTO> update(@PathVariable Long id,@RequestBody KindOfMusicDTO KindOfMusicdto) {
		KindOfMusicdto.setId(id);
		KindOfMusicdto = KindOfMusicservice.update(KindOfMusicdto);
		if (null == KindOfMusicdto) {
			throw new BadCredentialsException("Not found id Update");
		}
		return ResponseEntity.ok(KindOfMusicdto);
	}

	@GetMapping("/apitest/kind-of-music/{id}")
	public ResponseEntity<KindOfMusicDTO> getOne(@PathVariable("id") Long id) {
		KindOfMusicDTO KindOfMusicdto = KindOfMusicservice.findOne(id);
		if (KindOfMusicdto == null) {
			return new ResponseEntity<KindOfMusicDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(KindOfMusicdto);
	}

	@SuppressWarnings("rawtypes")
	@DeleteMapping("/apitest/kind-of-music/{id}")
	public ResponseEntity delete(@PathVariable Long id) {
		if (KindOfMusicservice.delete(id) == false) {
			return new ResponseEntity<KindOfMusicDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(id);
	}
	@GetMapping("/apitest/kind-of-music-all")
	public ResponseEntity<List<KindOfMusicDTO>> getallPage() {
		List<KindOfMusicDTO> listdto = KindOfMusicservice.findAll();
		return ResponseEntity.ok(listdto);
	}



}
