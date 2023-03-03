package shop.mtcoding.project.utilTest;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import org.junit.jupiter.api.Test;

public class DDayTest {

    @Test
    public void dDay_test() throws Exception {
        // LocalDate fromDate = LocalDate.of(2020, 8, 21);
        LocalDate fromDate = LocalDate.now();
        LocalDate toDate = LocalDate.of(2023, 3, 4);

        // ChronoUnit.DAYS.between
        System.out.println(ChronoUnit.DAYS.between(fromDate, toDate));
        assertThat(ChronoUnit.DAYS.between(fromDate, toDate))
                .isEqualTo(2);

        // until
        System.out.println(fromDate.until(toDate, ChronoUnit.DAYS));
        assertThat(fromDate.until(toDate, ChronoUnit.DAYS))
                .isEqualTo(2);

    }
}
