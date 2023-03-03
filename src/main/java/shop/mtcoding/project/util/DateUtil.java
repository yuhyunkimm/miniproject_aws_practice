package shop.mtcoding.project.util;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class DateUtil {
    public static String format(Timestamp stamp) {
        return stamp.toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public static long dDay(Timestamp stamp) {
        // LocalDate fromDate = LocalDate.of(2020, 8, 21);
        LocalDate fromDate = LocalDate.now();
        LocalDate toDate = LocalDate.parse(stamp.toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));

        // ChronoUnit.DAYS.between
        System.out.println(ChronoUnit.DAYS.between(fromDate, toDate));
        return ChronoUnit.DAYS.between(fromDate, toDate);
    }
}
