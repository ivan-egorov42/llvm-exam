int sum(int *arr, unsigned int size) {
    int res = 0;
    for (unsigned int i = 0; i < size; i++)
      res += arr[i];
    return res;
}