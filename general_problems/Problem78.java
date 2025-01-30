package general_problems;

import java.util.ArrayList;
import java.util.List;

public class Problem78 {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> subset = new ArrayList<>();
        powerSet(res, subset, nums, 0);
        return res;
    }

    public void powerSet(List<List<Integer>> res,
                         List<Integer> subset, int[] nums, int start) {
        res.add(new ArrayList<>(subset));
        for (int i = start; i < nums.length; i++) {
            subset.add(nums[i]);
            powerSet(res, subset, nums, i + 1);
            subset.remove(subset.size() - 1);
        }
    }

    public static void main(String[] args) {
        Problem78 p = new Problem78();
        System.out.println(p.subsets(new int[]{1, 2, 3}));
    }
}
