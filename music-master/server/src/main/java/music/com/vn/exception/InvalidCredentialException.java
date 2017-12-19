package music.com.vn.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.UNAUTHORIZED)
public class InvalidCredentialException extends Exception {

	private static final long serialVersionUID = 1L;

	public InvalidCredentialException(String message) {
		super(message);
	}
}
