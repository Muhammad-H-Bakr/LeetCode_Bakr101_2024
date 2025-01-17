package general_problems;

class Problem1492 {
    public int kthFactor(int n, int k) {
        if (k == 1) {
            return 1;
        }
        int count = 1;
        for (int i = 2; i <= n / 2; i++) {
            if (n % i == 0) {
                count++;
                if (count == k) {
                    return i;
                }
            }
        }
        if (n != 1) {
            count++;
        }
        if (count == k) {
            return n;
        }
        return -1;
    }
}