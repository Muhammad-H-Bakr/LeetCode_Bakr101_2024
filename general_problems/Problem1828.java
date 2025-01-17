package general_problems;

class Problem1828 {
    public int[] countPoints(int[][] points, int[][] queries) {
        int[] res = new int[queries.length];
        for (int i = 0; i < queries.length; i++) {
            for (int[] point : points) {
                if (Math.pow(point[0] - queries[i][0], 2) +
                        Math.pow(point[1] - queries[i][1], 2) <=
                        Math.pow(queries[i][2], 2)) {
                    res[i]++;
                }
            }
        }
        return res;
    }
}