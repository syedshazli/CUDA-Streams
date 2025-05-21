// kernels are run sequentially
#define N 1024;
__global__ void add(int *A, int *B, int *C){

	int tid = threadIdx.x + blockDim.x * blockIdx.x;
	C[tid] = B[tid] + A[tid];

}


__global__ void multiply(int *A, int *B, int *C){

	int tid = threadIdx.x + blockDim.x * blockIdx.x;
	C[tid] = B[tid] * A[tid];
}


int main(){

	int *dev_add_a;
	int *dev_add_b;
	int *dev_add_c;
	
	int add_a[N];
	int add_b[N];
	int add_c[N];
	
	int *dev_mult_a;
	int *dev_mult_b;
	int *dev_mult_c;
	
	int mult_a[N];
	int mult_b[N];
	int mult_c[N];


	// to benchmark/compare, if we want to run concurrently, all vars must be initialised

	cudaMalloc((void**)&dev_add_a, sizeof(int) * N);
	cudaMalloc((void**)&dev_add_b, sizeof(int) * N);
	cudaMalloc((void**)&dev_add_c, sizeof(int) * N);
	
	for(int i = 0; i< N; i++){
		
		add_a[i] = i;
		add_b[i] = i-1;

		mult_a[i] = i;
		mult_b[i] = i-1;
	
	}

	// if we're using the results of some array and not just storing, a memcpy from host to device is needed
	// assumes arrays a and b are pre filled
	cudaMemCpy();


}

