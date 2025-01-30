package general_problems;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Problem17 {
    public List<String> letterCombinations(String digits) {
        List<String> res = new ArrayList<>(); //answer.

        if (digits.isEmpty()) { //base case.
            return res;
        }

        //The needed data structures.
        Map<Integer, List<Character>> map = new HashMap<>();
        List<List<Character>> combine = new ArrayList<>();
        StringBuilder sb = new StringBuilder();

        //Mapping (digit -> characters) [I'm lazy AF].
        map.put(2, List.of('a', 'b', 'c'));
        map.put(3, List.of('d', 'e', 'f'));
        map.put(4, List.of('g', 'h', 'i'));
        map.put(5, List.of('j', 'k', 'l'));
        map.put(6, List.of('m', 'n', 'o'));
        map.put(7, List.of('p', 'q', 'r', 's'));
        map.put(8, List.of('t', 'u', 'v'));
        map.put(9, List.of('w', 'x', 'y', 'z'));

        //Combining the characters.
        for (char c : digits.toCharArray()) {
            combine.add(map.get(Character.getNumericValue(c)));
        }

        //Magic Happened here ✨.
        combine(combine, 0, sb, res);
        return res;
    }

    public void combine(List<List<Character>> combine,
                        int index, StringBuilder sb, List<String> res) {
        if (index == combine.size()) {
            res.add(sb.toString());
            return;
        }
        for (char c : combine.get(index)) {
            sb.append(c);
            combine(combine, index + 1, sb, res);
            sb.deleteCharAt(sb.length() - 1);
        }
    }

    public static void main(String[] args) {
        Problem17 p = new Problem17();
        System.out.println(p.letterCombinations("5678"));
    }
}
