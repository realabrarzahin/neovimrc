#include <bits/stdc++.h>

using i64 = long long;
using u64 = unsigned long long;

#define endl '\n'

void solve() {
  i64 n;
  std::cin >> n;

  std::vector<i64> a(n);
  for (int i = 0; i < n; i++) {
    std::cin >> a[i];
  }
}

int main() {

  std::ios::sync_with_stdio(false);
  std::cin.tie(nullptr);

  int t;
  std::cin >> t;
  while (t--) {
    solve();
  }

  return 0;
}
