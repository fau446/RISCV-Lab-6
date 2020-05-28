# C function unsigned long long fibo(int num) 
# int index=0
# int n = 13
# int fib_n1=0
# int fib_n2=1
# int fib_n=0
# int fib() {
#  if(n==0) 
#   	return fib_n;	
#  fib_n = fib_n1 + fib_n2
#	 fib_n1 = fib_n2
#  fib_n2 = fib_n
#  n=n-1
#  return fib;
# }
#
.data
.word 2, 4, 6, 8
n: .word 13

.text
main:   add     t0, x0, x0 # Set t0 to 0 the 0th fibonacci
        addi    t1, x0, 1  # Set t1 to 1 the 1st fibonacci
        la      t3, n # Load the address of n in t3
        lw      t3, 0(t3) # n = 13
		# Start the fibonacci function
fib:    beq     t3, x0, finish # if n==0 return fib_n
        add     t2, t1, t0 # t0 : n-1th fibonacci (fib_n1) , t1 : n-2nd fibonacci number (fib_n2), t2 contains : nth fibonacci number (fib_n)
        mv      t0, t1     # fib_n1 = fib_n2
        mv      t1, t2     # fib_n2 = fib_n
        addi    t3, t3, -1 # n = n - 1
        j       fib # return fib()
finish: addi    a0, x0, 1
        addi    a1, t0, 0
        ecall # print integer ecall
        addi    a0, x0, 10
        ecall # terminate ecall
