

export function factorial(n){
  if (n == 0)
    return 1;
  return n*factorial(n-1);
}

export function power(a, b){
  if (b == 0)
    return 1;
  return a*power(a, b-1);
}
