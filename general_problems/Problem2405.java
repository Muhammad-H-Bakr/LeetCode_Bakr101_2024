package general_problems;

import java.util.ArrayList;

class Problem2405 {
    public int partitionString(String s) {
        ArrayList<String> subs = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        for (char c : s.toCharArray()) {
            if (sb.indexOf(String.valueOf(c)) != -1) {
                subs.add(sb.toString());
                sb = new StringBuilder();
                sb.append(c);
            } else {
                sb.append(c);
            }
        }
        if (!sb.isEmpty()) {
            subs.add(sb.toString());
        }
        return subs.size();
    }
}
