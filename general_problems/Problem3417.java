package general_problems;

import java.util.ArrayList;
import java.util.List;

public class Problem3417 {
    public List<Integer> zigzagTraversal(int[][] grid) {
        List<Integer> res = new ArrayList<>();
        int flag = 1;
        for (int i = 0; i < grid.length; i++) {
            if (i % 2 == 0) {
                for (int j = 0; j < grid[i].length; j++) {
                    if (flag == 1) {
                        res.add(grid[i][j]);
                        flag = -1;
                    } else {
                        flag = 1;
                    }
                }
            } else {
                for (int j = grid[i].length - 1; j >= 0; j--) {
                    if (flag == 1) {
                        res.add(grid[i][j]);
                        flag = -1;
                    } else {
                        flag = 1;
                    }
                }
            }
        }
        return res;
    }
}
