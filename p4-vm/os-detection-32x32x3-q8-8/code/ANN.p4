
/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

const bit<16> TYPE_IPV4 = 0x800;

#define ET_ANN 0x88B5

#define FUNC_WEIGHTED_SUM_32_TO_32 1
#define FUNC_IDENTITY 2
#define FUNC_RELU 3
#define FUNC_ARGMAX 4
#define FUNC_NORMALIZATION 5
#define FUNC_WEIGHTED_SUM_32_TO_3 6

#define PRECISION 8
#define WORDSIZE 16
#define D_WORDSIZE 32
#define SLACK 8

/*************************************************************************
*********************** H E A D E R S  ***********************************
*************************************************************************/

typedef bit<9>  egressSpec_t;
typedef bit<48> macAddr_t;
typedef bit<32> ip4Addr_t;

header ethernet_t{
    macAddr_t dstAddr;
    macAddr_t srcAddr;
    bit<16>   etherType;
}

header ann_t{
    bit<32> neuron_id;
    bit<WORDSIZE> data_1;
    bit<WORDSIZE> data_2;
    bit<WORDSIZE> data_3;
    bit<WORDSIZE> data_4;
    bit<WORDSIZE> data_5;
    bit<WORDSIZE> data_6;
    bit<WORDSIZE> data_7;
    bit<WORDSIZE> data_8;
    bit<WORDSIZE> data_9;
    bit<WORDSIZE> data_10;
    bit<WORDSIZE> data_11;
    bit<WORDSIZE> data_12;
    bit<WORDSIZE> data_13;
    bit<WORDSIZE> data_14;
    bit<WORDSIZE> data_15;
    bit<WORDSIZE> data_16;
    bit<WORDSIZE> data_17;
    bit<WORDSIZE> data_18;
    bit<WORDSIZE> data_19;
    bit<WORDSIZE> data_20;
    bit<WORDSIZE> data_21;
    bit<WORDSIZE> data_22;
    bit<WORDSIZE> data_23;
    bit<WORDSIZE> data_24;
    bit<WORDSIZE> data_25;
    bit<WORDSIZE> data_26;
    bit<WORDSIZE> data_27;
    bit<WORDSIZE> data_28;
    bit<WORDSIZE> data_29;
    bit<WORDSIZE> data_30;
    bit<WORDSIZE> data_31;
    bit<WORDSIZE> data_32;
    bit<16> run_id;
    bit<SLACK> slack;
}

struct metadata{
    bit<32> neuron_id;            // temporarily stores the ID of the neuron in this switch.
    bit<32> n_expected_stimuli;   // temporarily stores the number of expected stimuli by the neuron in a single ANN run.
    bit<32> n_received_stimuli;   // temporarily stores the number of stimuli already received by the neuron in the current ANN run.
    bit<128> expected_stimuli;    // temporarily stores a bitstring that indicates from which neurons is the neuron expected to receive stimuli. For example, if the bitstring has value 0b1010, the neuron is expected to receive stimuli from neurons with ID 1 and 3, but not from IDs 0 and 2.
    bit<128> received_stimuli;    // temporarily stores a bitstring that indicates from which neurons is the neuron already received stimuli in the current ANN run.

    bit<32> agg_func;
    bit<32> activation_func;
    bit<16> run_id;

    // Stores the data to be processed and fowarded
    bit<WORDSIZE> neuron_1_data;
    bit<WORDSIZE> neuron_2_data;
    bit<WORDSIZE> neuron_3_data;
    bit<WORDSIZE> neuron_4_data;
    bit<WORDSIZE> neuron_5_data;
    bit<WORDSIZE> neuron_6_data;
    bit<WORDSIZE> neuron_7_data;
    bit<WORDSIZE> neuron_8_data;
    bit<WORDSIZE> neuron_9_data;
    bit<WORDSIZE> neuron_10_data;
    bit<WORDSIZE> neuron_11_data;
    bit<WORDSIZE> neuron_12_data;
    bit<WORDSIZE> neuron_13_data;
    bit<WORDSIZE> neuron_14_data;
    bit<WORDSIZE> neuron_15_data;
    bit<WORDSIZE> neuron_16_data;
    bit<WORDSIZE> neuron_17_data;
    bit<WORDSIZE> neuron_18_data;
    bit<WORDSIZE> neuron_19_data;
    bit<WORDSIZE> neuron_20_data;
    bit<WORDSIZE> neuron_21_data;
    bit<WORDSIZE> neuron_22_data;
    bit<WORDSIZE> neuron_23_data;
    bit<WORDSIZE> neuron_24_data;
    bit<WORDSIZE> neuron_25_data;
    bit<WORDSIZE> neuron_26_data;
    bit<WORDSIZE> neuron_27_data;
    bit<WORDSIZE> neuron_28_data;
    bit<WORDSIZE> neuron_29_data;
    bit<WORDSIZE> neuron_30_data;
    bit<WORDSIZE> neuron_31_data;
    bit<WORDSIZE> neuron_32_data;

    // Agg func = normalization
    bit<WORDSIZE> neuron_1_mean;
    bit<WORDSIZE> neuron_1_std;
    bit<WORDSIZE> neuron_2_mean;
    bit<WORDSIZE> neuron_2_std;
    bit<WORDSIZE> neuron_3_mean;
    bit<WORDSIZE> neuron_3_std;
    bit<WORDSIZE> neuron_4_mean;
    bit<WORDSIZE> neuron_4_std;
    bit<WORDSIZE> neuron_5_mean;
    bit<WORDSIZE> neuron_5_std;
    bit<WORDSIZE> neuron_6_mean;
    bit<WORDSIZE> neuron_6_std;
    bit<WORDSIZE> neuron_7_mean;
    bit<WORDSIZE> neuron_7_std;
    bit<WORDSIZE> neuron_8_mean;
    bit<WORDSIZE> neuron_8_std;
    bit<WORDSIZE> neuron_9_mean;
    bit<WORDSIZE> neuron_9_std;
    bit<WORDSIZE> neuron_10_mean;
    bit<WORDSIZE> neuron_10_std;
    bit<WORDSIZE> neuron_11_mean;
    bit<WORDSIZE> neuron_11_std;
    bit<WORDSIZE> neuron_12_mean;
    bit<WORDSIZE> neuron_12_std;
    bit<WORDSIZE> neuron_13_mean;
    bit<WORDSIZE> neuron_13_std;
    bit<WORDSIZE> neuron_14_mean;
    bit<WORDSIZE> neuron_14_std;
    bit<WORDSIZE> neuron_15_mean;
    bit<WORDSIZE> neuron_15_std;
    bit<WORDSIZE> neuron_16_mean;
    bit<WORDSIZE> neuron_16_std;
    bit<WORDSIZE> neuron_17_mean;
    bit<WORDSIZE> neuron_17_std;
    bit<WORDSIZE> neuron_18_mean;
    bit<WORDSIZE> neuron_18_std;
    bit<WORDSIZE> neuron_19_mean;
    bit<WORDSIZE> neuron_19_std;
    bit<WORDSIZE> neuron_20_mean;
    bit<WORDSIZE> neuron_20_std;
    bit<WORDSIZE> neuron_21_mean;
    bit<WORDSIZE> neuron_21_std;
    bit<WORDSIZE> neuron_22_mean;
    bit<WORDSIZE> neuron_22_std;
    bit<WORDSIZE> neuron_23_mean;
    bit<WORDSIZE> neuron_23_std;
    bit<WORDSIZE> neuron_24_mean;
    bit<WORDSIZE> neuron_24_std;
    bit<WORDSIZE> neuron_25_mean;
    bit<WORDSIZE> neuron_25_std;
    bit<WORDSIZE> neuron_26_mean;
    bit<WORDSIZE> neuron_26_std;
    bit<WORDSIZE> neuron_27_mean;
    bit<WORDSIZE> neuron_27_std;
    bit<WORDSIZE> neuron_28_mean;
    bit<WORDSIZE> neuron_28_std;
    bit<WORDSIZE> neuron_29_mean;
    bit<WORDSIZE> neuron_29_std;
    bit<WORDSIZE> neuron_30_mean;
    bit<WORDSIZE> neuron_30_std;
    bit<WORDSIZE> neuron_31_mean;
    bit<WORDSIZE> neuron_31_std;
    bit<WORDSIZE> neuron_32_mean;
    bit<WORDSIZE> neuron_32_std;

    // Agg func = weighted sum
    bit<WORDSIZE> neuron_1_bias;
    bit<WORDSIZE> neuron_2_bias;
    bit<WORDSIZE> neuron_3_bias;
    bit<WORDSIZE> neuron_4_bias;
    bit<WORDSIZE> neuron_5_bias;
    bit<WORDSIZE> neuron_6_bias;
    bit<WORDSIZE> neuron_7_bias;
    bit<WORDSIZE> neuron_8_bias;
    bit<WORDSIZE> neuron_9_bias;
    bit<WORDSIZE> neuron_10_bias;
    bit<WORDSIZE> neuron_11_bias;
    bit<WORDSIZE> neuron_12_bias;
    bit<WORDSIZE> neuron_13_bias;
    bit<WORDSIZE> neuron_14_bias;
    bit<WORDSIZE> neuron_15_bias;
    bit<WORDSIZE> neuron_16_bias;
    bit<WORDSIZE> neuron_17_bias;
    bit<WORDSIZE> neuron_18_bias;
    bit<WORDSIZE> neuron_19_bias;
    bit<WORDSIZE> neuron_20_bias;
    bit<WORDSIZE> neuron_21_bias;
    bit<WORDSIZE> neuron_22_bias;
    bit<WORDSIZE> neuron_23_bias;
    bit<WORDSIZE> neuron_24_bias;
    bit<WORDSIZE> neuron_25_bias;
    bit<WORDSIZE> neuron_26_bias;
    bit<WORDSIZE> neuron_27_bias;
    bit<WORDSIZE> neuron_28_bias;
    bit<WORDSIZE> neuron_29_bias;
    bit<WORDSIZE> neuron_30_bias;
    bit<WORDSIZE> neuron_31_bias;
    bit<WORDSIZE> neuron_32_bias;
    bit<WORDSIZE> n2n_1_weight_1;
    bit<WORDSIZE> n2n_1_weight_2;
    bit<WORDSIZE> n2n_1_weight_3;
    bit<WORDSIZE> n2n_1_weight_4;
    bit<WORDSIZE> n2n_1_weight_5;
    bit<WORDSIZE> n2n_1_weight_6;
    bit<WORDSIZE> n2n_1_weight_7;
    bit<WORDSIZE> n2n_1_weight_8;
    bit<WORDSIZE> n2n_1_weight_9;
    bit<WORDSIZE> n2n_1_weight_10;
    bit<WORDSIZE> n2n_1_weight_11;
    bit<WORDSIZE> n2n_1_weight_12;
    bit<WORDSIZE> n2n_1_weight_13;
    bit<WORDSIZE> n2n_1_weight_14;
    bit<WORDSIZE> n2n_1_weight_15;
    bit<WORDSIZE> n2n_1_weight_16;
    bit<WORDSIZE> n2n_1_weight_17;
    bit<WORDSIZE> n2n_1_weight_18;
    bit<WORDSIZE> n2n_1_weight_19;
    bit<WORDSIZE> n2n_1_weight_20;
    bit<WORDSIZE> n2n_1_weight_21;
    bit<WORDSIZE> n2n_1_weight_22;
    bit<WORDSIZE> n2n_1_weight_23;
    bit<WORDSIZE> n2n_1_weight_24;
    bit<WORDSIZE> n2n_1_weight_25;
    bit<WORDSIZE> n2n_1_weight_26;
    bit<WORDSIZE> n2n_1_weight_27;
    bit<WORDSIZE> n2n_1_weight_28;
    bit<WORDSIZE> n2n_1_weight_29;
    bit<WORDSIZE> n2n_1_weight_30;
    bit<WORDSIZE> n2n_1_weight_31;
    bit<WORDSIZE> n2n_1_weight_32;
    bit<WORDSIZE> n2n_2_weight_1;
    bit<WORDSIZE> n2n_2_weight_2;
    bit<WORDSIZE> n2n_2_weight_3;
    bit<WORDSIZE> n2n_2_weight_4;
    bit<WORDSIZE> n2n_2_weight_5;
    bit<WORDSIZE> n2n_2_weight_6;
    bit<WORDSIZE> n2n_2_weight_7;
    bit<WORDSIZE> n2n_2_weight_8;
    bit<WORDSIZE> n2n_2_weight_9;
    bit<WORDSIZE> n2n_2_weight_10;
    bit<WORDSIZE> n2n_2_weight_11;
    bit<WORDSIZE> n2n_2_weight_12;
    bit<WORDSIZE> n2n_2_weight_13;
    bit<WORDSIZE> n2n_2_weight_14;
    bit<WORDSIZE> n2n_2_weight_15;
    bit<WORDSIZE> n2n_2_weight_16;
    bit<WORDSIZE> n2n_2_weight_17;
    bit<WORDSIZE> n2n_2_weight_18;
    bit<WORDSIZE> n2n_2_weight_19;
    bit<WORDSIZE> n2n_2_weight_20;
    bit<WORDSIZE> n2n_2_weight_21;
    bit<WORDSIZE> n2n_2_weight_22;
    bit<WORDSIZE> n2n_2_weight_23;
    bit<WORDSIZE> n2n_2_weight_24;
    bit<WORDSIZE> n2n_2_weight_25;
    bit<WORDSIZE> n2n_2_weight_26;
    bit<WORDSIZE> n2n_2_weight_27;
    bit<WORDSIZE> n2n_2_weight_28;
    bit<WORDSIZE> n2n_2_weight_29;
    bit<WORDSIZE> n2n_2_weight_30;
    bit<WORDSIZE> n2n_2_weight_31;
    bit<WORDSIZE> n2n_2_weight_32;
    bit<WORDSIZE> n2n_3_weight_1;
    bit<WORDSIZE> n2n_3_weight_2;
    bit<WORDSIZE> n2n_3_weight_3;
    bit<WORDSIZE> n2n_3_weight_4;
    bit<WORDSIZE> n2n_3_weight_5;
    bit<WORDSIZE> n2n_3_weight_6;
    bit<WORDSIZE> n2n_3_weight_7;
    bit<WORDSIZE> n2n_3_weight_8;
    bit<WORDSIZE> n2n_3_weight_9;
    bit<WORDSIZE> n2n_3_weight_10;
    bit<WORDSIZE> n2n_3_weight_11;
    bit<WORDSIZE> n2n_3_weight_12;
    bit<WORDSIZE> n2n_3_weight_13;
    bit<WORDSIZE> n2n_3_weight_14;
    bit<WORDSIZE> n2n_3_weight_15;
    bit<WORDSIZE> n2n_3_weight_16;
    bit<WORDSIZE> n2n_3_weight_17;
    bit<WORDSIZE> n2n_3_weight_18;
    bit<WORDSIZE> n2n_3_weight_19;
    bit<WORDSIZE> n2n_3_weight_20;
    bit<WORDSIZE> n2n_3_weight_21;
    bit<WORDSIZE> n2n_3_weight_22;
    bit<WORDSIZE> n2n_3_weight_23;
    bit<WORDSIZE> n2n_3_weight_24;
    bit<WORDSIZE> n2n_3_weight_25;
    bit<WORDSIZE> n2n_3_weight_26;
    bit<WORDSIZE> n2n_3_weight_27;
    bit<WORDSIZE> n2n_3_weight_28;
    bit<WORDSIZE> n2n_3_weight_29;
    bit<WORDSIZE> n2n_3_weight_30;
    bit<WORDSIZE> n2n_3_weight_31;
    bit<WORDSIZE> n2n_3_weight_32;
    bit<WORDSIZE> n2n_4_weight_1;
    bit<WORDSIZE> n2n_4_weight_2;
    bit<WORDSIZE> n2n_4_weight_3;
    bit<WORDSIZE> n2n_4_weight_4;
    bit<WORDSIZE> n2n_4_weight_5;
    bit<WORDSIZE> n2n_4_weight_6;
    bit<WORDSIZE> n2n_4_weight_7;
    bit<WORDSIZE> n2n_4_weight_8;
    bit<WORDSIZE> n2n_4_weight_9;
    bit<WORDSIZE> n2n_4_weight_10;
    bit<WORDSIZE> n2n_4_weight_11;
    bit<WORDSIZE> n2n_4_weight_12;
    bit<WORDSIZE> n2n_4_weight_13;
    bit<WORDSIZE> n2n_4_weight_14;
    bit<WORDSIZE> n2n_4_weight_15;
    bit<WORDSIZE> n2n_4_weight_16;
    bit<WORDSIZE> n2n_4_weight_17;
    bit<WORDSIZE> n2n_4_weight_18;
    bit<WORDSIZE> n2n_4_weight_19;
    bit<WORDSIZE> n2n_4_weight_20;
    bit<WORDSIZE> n2n_4_weight_21;
    bit<WORDSIZE> n2n_4_weight_22;
    bit<WORDSIZE> n2n_4_weight_23;
    bit<WORDSIZE> n2n_4_weight_24;
    bit<WORDSIZE> n2n_4_weight_25;
    bit<WORDSIZE> n2n_4_weight_26;
    bit<WORDSIZE> n2n_4_weight_27;
    bit<WORDSIZE> n2n_4_weight_28;
    bit<WORDSIZE> n2n_4_weight_29;
    bit<WORDSIZE> n2n_4_weight_30;
    bit<WORDSIZE> n2n_4_weight_31;
    bit<WORDSIZE> n2n_4_weight_32;
    bit<WORDSIZE> n2n_5_weight_1;
    bit<WORDSIZE> n2n_5_weight_2;
    bit<WORDSIZE> n2n_5_weight_3;
    bit<WORDSIZE> n2n_5_weight_4;
    bit<WORDSIZE> n2n_5_weight_5;
    bit<WORDSIZE> n2n_5_weight_6;
    bit<WORDSIZE> n2n_5_weight_7;
    bit<WORDSIZE> n2n_5_weight_8;
    bit<WORDSIZE> n2n_5_weight_9;
    bit<WORDSIZE> n2n_5_weight_10;
    bit<WORDSIZE> n2n_5_weight_11;
    bit<WORDSIZE> n2n_5_weight_12;
    bit<WORDSIZE> n2n_5_weight_13;
    bit<WORDSIZE> n2n_5_weight_14;
    bit<WORDSIZE> n2n_5_weight_15;
    bit<WORDSIZE> n2n_5_weight_16;
    bit<WORDSIZE> n2n_5_weight_17;
    bit<WORDSIZE> n2n_5_weight_18;
    bit<WORDSIZE> n2n_5_weight_19;
    bit<WORDSIZE> n2n_5_weight_20;
    bit<WORDSIZE> n2n_5_weight_21;
    bit<WORDSIZE> n2n_5_weight_22;
    bit<WORDSIZE> n2n_5_weight_23;
    bit<WORDSIZE> n2n_5_weight_24;
    bit<WORDSIZE> n2n_5_weight_25;
    bit<WORDSIZE> n2n_5_weight_26;
    bit<WORDSIZE> n2n_5_weight_27;
    bit<WORDSIZE> n2n_5_weight_28;
    bit<WORDSIZE> n2n_5_weight_29;
    bit<WORDSIZE> n2n_5_weight_30;
    bit<WORDSIZE> n2n_5_weight_31;
    bit<WORDSIZE> n2n_5_weight_32;
    bit<WORDSIZE> n2n_6_weight_1;
    bit<WORDSIZE> n2n_6_weight_2;
    bit<WORDSIZE> n2n_6_weight_3;
    bit<WORDSIZE> n2n_6_weight_4;
    bit<WORDSIZE> n2n_6_weight_5;
    bit<WORDSIZE> n2n_6_weight_6;
    bit<WORDSIZE> n2n_6_weight_7;
    bit<WORDSIZE> n2n_6_weight_8;
    bit<WORDSIZE> n2n_6_weight_9;
    bit<WORDSIZE> n2n_6_weight_10;
    bit<WORDSIZE> n2n_6_weight_11;
    bit<WORDSIZE> n2n_6_weight_12;
    bit<WORDSIZE> n2n_6_weight_13;
    bit<WORDSIZE> n2n_6_weight_14;
    bit<WORDSIZE> n2n_6_weight_15;
    bit<WORDSIZE> n2n_6_weight_16;
    bit<WORDSIZE> n2n_6_weight_17;
    bit<WORDSIZE> n2n_6_weight_18;
    bit<WORDSIZE> n2n_6_weight_19;
    bit<WORDSIZE> n2n_6_weight_20;
    bit<WORDSIZE> n2n_6_weight_21;
    bit<WORDSIZE> n2n_6_weight_22;
    bit<WORDSIZE> n2n_6_weight_23;
    bit<WORDSIZE> n2n_6_weight_24;
    bit<WORDSIZE> n2n_6_weight_25;
    bit<WORDSIZE> n2n_6_weight_26;
    bit<WORDSIZE> n2n_6_weight_27;
    bit<WORDSIZE> n2n_6_weight_28;
    bit<WORDSIZE> n2n_6_weight_29;
    bit<WORDSIZE> n2n_6_weight_30;
    bit<WORDSIZE> n2n_6_weight_31;
    bit<WORDSIZE> n2n_6_weight_32;
    bit<WORDSIZE> n2n_7_weight_1;
    bit<WORDSIZE> n2n_7_weight_2;
    bit<WORDSIZE> n2n_7_weight_3;
    bit<WORDSIZE> n2n_7_weight_4;
    bit<WORDSIZE> n2n_7_weight_5;
    bit<WORDSIZE> n2n_7_weight_6;
    bit<WORDSIZE> n2n_7_weight_7;
    bit<WORDSIZE> n2n_7_weight_8;
    bit<WORDSIZE> n2n_7_weight_9;
    bit<WORDSIZE> n2n_7_weight_10;
    bit<WORDSIZE> n2n_7_weight_11;
    bit<WORDSIZE> n2n_7_weight_12;
    bit<WORDSIZE> n2n_7_weight_13;
    bit<WORDSIZE> n2n_7_weight_14;
    bit<WORDSIZE> n2n_7_weight_15;
    bit<WORDSIZE> n2n_7_weight_16;
    bit<WORDSIZE> n2n_7_weight_17;
    bit<WORDSIZE> n2n_7_weight_18;
    bit<WORDSIZE> n2n_7_weight_19;
    bit<WORDSIZE> n2n_7_weight_20;
    bit<WORDSIZE> n2n_7_weight_21;
    bit<WORDSIZE> n2n_7_weight_22;
    bit<WORDSIZE> n2n_7_weight_23;
    bit<WORDSIZE> n2n_7_weight_24;
    bit<WORDSIZE> n2n_7_weight_25;
    bit<WORDSIZE> n2n_7_weight_26;
    bit<WORDSIZE> n2n_7_weight_27;
    bit<WORDSIZE> n2n_7_weight_28;
    bit<WORDSIZE> n2n_7_weight_29;
    bit<WORDSIZE> n2n_7_weight_30;
    bit<WORDSIZE> n2n_7_weight_31;
    bit<WORDSIZE> n2n_7_weight_32;
    bit<WORDSIZE> n2n_8_weight_1;
    bit<WORDSIZE> n2n_8_weight_2;
    bit<WORDSIZE> n2n_8_weight_3;
    bit<WORDSIZE> n2n_8_weight_4;
    bit<WORDSIZE> n2n_8_weight_5;
    bit<WORDSIZE> n2n_8_weight_6;
    bit<WORDSIZE> n2n_8_weight_7;
    bit<WORDSIZE> n2n_8_weight_8;
    bit<WORDSIZE> n2n_8_weight_9;
    bit<WORDSIZE> n2n_8_weight_10;
    bit<WORDSIZE> n2n_8_weight_11;
    bit<WORDSIZE> n2n_8_weight_12;
    bit<WORDSIZE> n2n_8_weight_13;
    bit<WORDSIZE> n2n_8_weight_14;
    bit<WORDSIZE> n2n_8_weight_15;
    bit<WORDSIZE> n2n_8_weight_16;
    bit<WORDSIZE> n2n_8_weight_17;
    bit<WORDSIZE> n2n_8_weight_18;
    bit<WORDSIZE> n2n_8_weight_19;
    bit<WORDSIZE> n2n_8_weight_20;
    bit<WORDSIZE> n2n_8_weight_21;
    bit<WORDSIZE> n2n_8_weight_22;
    bit<WORDSIZE> n2n_8_weight_23;
    bit<WORDSIZE> n2n_8_weight_24;
    bit<WORDSIZE> n2n_8_weight_25;
    bit<WORDSIZE> n2n_8_weight_26;
    bit<WORDSIZE> n2n_8_weight_27;
    bit<WORDSIZE> n2n_8_weight_28;
    bit<WORDSIZE> n2n_8_weight_29;
    bit<WORDSIZE> n2n_8_weight_30;
    bit<WORDSIZE> n2n_8_weight_31;
    bit<WORDSIZE> n2n_8_weight_32;
    bit<WORDSIZE> n2n_9_weight_1;
    bit<WORDSIZE> n2n_9_weight_2;
    bit<WORDSIZE> n2n_9_weight_3;
    bit<WORDSIZE> n2n_9_weight_4;
    bit<WORDSIZE> n2n_9_weight_5;
    bit<WORDSIZE> n2n_9_weight_6;
    bit<WORDSIZE> n2n_9_weight_7;
    bit<WORDSIZE> n2n_9_weight_8;
    bit<WORDSIZE> n2n_9_weight_9;
    bit<WORDSIZE> n2n_9_weight_10;
    bit<WORDSIZE> n2n_9_weight_11;
    bit<WORDSIZE> n2n_9_weight_12;
    bit<WORDSIZE> n2n_9_weight_13;
    bit<WORDSIZE> n2n_9_weight_14;
    bit<WORDSIZE> n2n_9_weight_15;
    bit<WORDSIZE> n2n_9_weight_16;
    bit<WORDSIZE> n2n_9_weight_17;
    bit<WORDSIZE> n2n_9_weight_18;
    bit<WORDSIZE> n2n_9_weight_19;
    bit<WORDSIZE> n2n_9_weight_20;
    bit<WORDSIZE> n2n_9_weight_21;
    bit<WORDSIZE> n2n_9_weight_22;
    bit<WORDSIZE> n2n_9_weight_23;
    bit<WORDSIZE> n2n_9_weight_24;
    bit<WORDSIZE> n2n_9_weight_25;
    bit<WORDSIZE> n2n_9_weight_26;
    bit<WORDSIZE> n2n_9_weight_27;
    bit<WORDSIZE> n2n_9_weight_28;
    bit<WORDSIZE> n2n_9_weight_29;
    bit<WORDSIZE> n2n_9_weight_30;
    bit<WORDSIZE> n2n_9_weight_31;
    bit<WORDSIZE> n2n_9_weight_32;
    bit<WORDSIZE> n2n_10_weight_1;
    bit<WORDSIZE> n2n_10_weight_2;
    bit<WORDSIZE> n2n_10_weight_3;
    bit<WORDSIZE> n2n_10_weight_4;
    bit<WORDSIZE> n2n_10_weight_5;
    bit<WORDSIZE> n2n_10_weight_6;
    bit<WORDSIZE> n2n_10_weight_7;
    bit<WORDSIZE> n2n_10_weight_8;
    bit<WORDSIZE> n2n_10_weight_9;
    bit<WORDSIZE> n2n_10_weight_10;
    bit<WORDSIZE> n2n_10_weight_11;
    bit<WORDSIZE> n2n_10_weight_12;
    bit<WORDSIZE> n2n_10_weight_13;
    bit<WORDSIZE> n2n_10_weight_14;
    bit<WORDSIZE> n2n_10_weight_15;
    bit<WORDSIZE> n2n_10_weight_16;
    bit<WORDSIZE> n2n_10_weight_17;
    bit<WORDSIZE> n2n_10_weight_18;
    bit<WORDSIZE> n2n_10_weight_19;
    bit<WORDSIZE> n2n_10_weight_20;
    bit<WORDSIZE> n2n_10_weight_21;
    bit<WORDSIZE> n2n_10_weight_22;
    bit<WORDSIZE> n2n_10_weight_23;
    bit<WORDSIZE> n2n_10_weight_24;
    bit<WORDSIZE> n2n_10_weight_25;
    bit<WORDSIZE> n2n_10_weight_26;
    bit<WORDSIZE> n2n_10_weight_27;
    bit<WORDSIZE> n2n_10_weight_28;
    bit<WORDSIZE> n2n_10_weight_29;
    bit<WORDSIZE> n2n_10_weight_30;
    bit<WORDSIZE> n2n_10_weight_31;
    bit<WORDSIZE> n2n_10_weight_32;
    bit<WORDSIZE> n2n_11_weight_1;
    bit<WORDSIZE> n2n_11_weight_2;
    bit<WORDSIZE> n2n_11_weight_3;
    bit<WORDSIZE> n2n_11_weight_4;
    bit<WORDSIZE> n2n_11_weight_5;
    bit<WORDSIZE> n2n_11_weight_6;
    bit<WORDSIZE> n2n_11_weight_7;
    bit<WORDSIZE> n2n_11_weight_8;
    bit<WORDSIZE> n2n_11_weight_9;
    bit<WORDSIZE> n2n_11_weight_10;
    bit<WORDSIZE> n2n_11_weight_11;
    bit<WORDSIZE> n2n_11_weight_12;
    bit<WORDSIZE> n2n_11_weight_13;
    bit<WORDSIZE> n2n_11_weight_14;
    bit<WORDSIZE> n2n_11_weight_15;
    bit<WORDSIZE> n2n_11_weight_16;
    bit<WORDSIZE> n2n_11_weight_17;
    bit<WORDSIZE> n2n_11_weight_18;
    bit<WORDSIZE> n2n_11_weight_19;
    bit<WORDSIZE> n2n_11_weight_20;
    bit<WORDSIZE> n2n_11_weight_21;
    bit<WORDSIZE> n2n_11_weight_22;
    bit<WORDSIZE> n2n_11_weight_23;
    bit<WORDSIZE> n2n_11_weight_24;
    bit<WORDSIZE> n2n_11_weight_25;
    bit<WORDSIZE> n2n_11_weight_26;
    bit<WORDSIZE> n2n_11_weight_27;
    bit<WORDSIZE> n2n_11_weight_28;
    bit<WORDSIZE> n2n_11_weight_29;
    bit<WORDSIZE> n2n_11_weight_30;
    bit<WORDSIZE> n2n_11_weight_31;
    bit<WORDSIZE> n2n_11_weight_32;
    bit<WORDSIZE> n2n_12_weight_1;
    bit<WORDSIZE> n2n_12_weight_2;
    bit<WORDSIZE> n2n_12_weight_3;
    bit<WORDSIZE> n2n_12_weight_4;
    bit<WORDSIZE> n2n_12_weight_5;
    bit<WORDSIZE> n2n_12_weight_6;
    bit<WORDSIZE> n2n_12_weight_7;
    bit<WORDSIZE> n2n_12_weight_8;
    bit<WORDSIZE> n2n_12_weight_9;
    bit<WORDSIZE> n2n_12_weight_10;
    bit<WORDSIZE> n2n_12_weight_11;
    bit<WORDSIZE> n2n_12_weight_12;
    bit<WORDSIZE> n2n_12_weight_13;
    bit<WORDSIZE> n2n_12_weight_14;
    bit<WORDSIZE> n2n_12_weight_15;
    bit<WORDSIZE> n2n_12_weight_16;
    bit<WORDSIZE> n2n_12_weight_17;
    bit<WORDSIZE> n2n_12_weight_18;
    bit<WORDSIZE> n2n_12_weight_19;
    bit<WORDSIZE> n2n_12_weight_20;
    bit<WORDSIZE> n2n_12_weight_21;
    bit<WORDSIZE> n2n_12_weight_22;
    bit<WORDSIZE> n2n_12_weight_23;
    bit<WORDSIZE> n2n_12_weight_24;
    bit<WORDSIZE> n2n_12_weight_25;
    bit<WORDSIZE> n2n_12_weight_26;
    bit<WORDSIZE> n2n_12_weight_27;
    bit<WORDSIZE> n2n_12_weight_28;
    bit<WORDSIZE> n2n_12_weight_29;
    bit<WORDSIZE> n2n_12_weight_30;
    bit<WORDSIZE> n2n_12_weight_31;
    bit<WORDSIZE> n2n_12_weight_32;
    bit<WORDSIZE> n2n_13_weight_1;
    bit<WORDSIZE> n2n_13_weight_2;
    bit<WORDSIZE> n2n_13_weight_3;
    bit<WORDSIZE> n2n_13_weight_4;
    bit<WORDSIZE> n2n_13_weight_5;
    bit<WORDSIZE> n2n_13_weight_6;
    bit<WORDSIZE> n2n_13_weight_7;
    bit<WORDSIZE> n2n_13_weight_8;
    bit<WORDSIZE> n2n_13_weight_9;
    bit<WORDSIZE> n2n_13_weight_10;
    bit<WORDSIZE> n2n_13_weight_11;
    bit<WORDSIZE> n2n_13_weight_12;
    bit<WORDSIZE> n2n_13_weight_13;
    bit<WORDSIZE> n2n_13_weight_14;
    bit<WORDSIZE> n2n_13_weight_15;
    bit<WORDSIZE> n2n_13_weight_16;
    bit<WORDSIZE> n2n_13_weight_17;
    bit<WORDSIZE> n2n_13_weight_18;
    bit<WORDSIZE> n2n_13_weight_19;
    bit<WORDSIZE> n2n_13_weight_20;
    bit<WORDSIZE> n2n_13_weight_21;
    bit<WORDSIZE> n2n_13_weight_22;
    bit<WORDSIZE> n2n_13_weight_23;
    bit<WORDSIZE> n2n_13_weight_24;
    bit<WORDSIZE> n2n_13_weight_25;
    bit<WORDSIZE> n2n_13_weight_26;
    bit<WORDSIZE> n2n_13_weight_27;
    bit<WORDSIZE> n2n_13_weight_28;
    bit<WORDSIZE> n2n_13_weight_29;
    bit<WORDSIZE> n2n_13_weight_30;
    bit<WORDSIZE> n2n_13_weight_31;
    bit<WORDSIZE> n2n_13_weight_32;
    bit<WORDSIZE> n2n_14_weight_1;
    bit<WORDSIZE> n2n_14_weight_2;
    bit<WORDSIZE> n2n_14_weight_3;
    bit<WORDSIZE> n2n_14_weight_4;
    bit<WORDSIZE> n2n_14_weight_5;
    bit<WORDSIZE> n2n_14_weight_6;
    bit<WORDSIZE> n2n_14_weight_7;
    bit<WORDSIZE> n2n_14_weight_8;
    bit<WORDSIZE> n2n_14_weight_9;
    bit<WORDSIZE> n2n_14_weight_10;
    bit<WORDSIZE> n2n_14_weight_11;
    bit<WORDSIZE> n2n_14_weight_12;
    bit<WORDSIZE> n2n_14_weight_13;
    bit<WORDSIZE> n2n_14_weight_14;
    bit<WORDSIZE> n2n_14_weight_15;
    bit<WORDSIZE> n2n_14_weight_16;
    bit<WORDSIZE> n2n_14_weight_17;
    bit<WORDSIZE> n2n_14_weight_18;
    bit<WORDSIZE> n2n_14_weight_19;
    bit<WORDSIZE> n2n_14_weight_20;
    bit<WORDSIZE> n2n_14_weight_21;
    bit<WORDSIZE> n2n_14_weight_22;
    bit<WORDSIZE> n2n_14_weight_23;
    bit<WORDSIZE> n2n_14_weight_24;
    bit<WORDSIZE> n2n_14_weight_25;
    bit<WORDSIZE> n2n_14_weight_26;
    bit<WORDSIZE> n2n_14_weight_27;
    bit<WORDSIZE> n2n_14_weight_28;
    bit<WORDSIZE> n2n_14_weight_29;
    bit<WORDSIZE> n2n_14_weight_30;
    bit<WORDSIZE> n2n_14_weight_31;
    bit<WORDSIZE> n2n_14_weight_32;
    bit<WORDSIZE> n2n_15_weight_1;
    bit<WORDSIZE> n2n_15_weight_2;
    bit<WORDSIZE> n2n_15_weight_3;
    bit<WORDSIZE> n2n_15_weight_4;
    bit<WORDSIZE> n2n_15_weight_5;
    bit<WORDSIZE> n2n_15_weight_6;
    bit<WORDSIZE> n2n_15_weight_7;
    bit<WORDSIZE> n2n_15_weight_8;
    bit<WORDSIZE> n2n_15_weight_9;
    bit<WORDSIZE> n2n_15_weight_10;
    bit<WORDSIZE> n2n_15_weight_11;
    bit<WORDSIZE> n2n_15_weight_12;
    bit<WORDSIZE> n2n_15_weight_13;
    bit<WORDSIZE> n2n_15_weight_14;
    bit<WORDSIZE> n2n_15_weight_15;
    bit<WORDSIZE> n2n_15_weight_16;
    bit<WORDSIZE> n2n_15_weight_17;
    bit<WORDSIZE> n2n_15_weight_18;
    bit<WORDSIZE> n2n_15_weight_19;
    bit<WORDSIZE> n2n_15_weight_20;
    bit<WORDSIZE> n2n_15_weight_21;
    bit<WORDSIZE> n2n_15_weight_22;
    bit<WORDSIZE> n2n_15_weight_23;
    bit<WORDSIZE> n2n_15_weight_24;
    bit<WORDSIZE> n2n_15_weight_25;
    bit<WORDSIZE> n2n_15_weight_26;
    bit<WORDSIZE> n2n_15_weight_27;
    bit<WORDSIZE> n2n_15_weight_28;
    bit<WORDSIZE> n2n_15_weight_29;
    bit<WORDSIZE> n2n_15_weight_30;
    bit<WORDSIZE> n2n_15_weight_31;
    bit<WORDSIZE> n2n_15_weight_32;
    bit<WORDSIZE> n2n_16_weight_1;
    bit<WORDSIZE> n2n_16_weight_2;
    bit<WORDSIZE> n2n_16_weight_3;
    bit<WORDSIZE> n2n_16_weight_4;
    bit<WORDSIZE> n2n_16_weight_5;
    bit<WORDSIZE> n2n_16_weight_6;
    bit<WORDSIZE> n2n_16_weight_7;
    bit<WORDSIZE> n2n_16_weight_8;
    bit<WORDSIZE> n2n_16_weight_9;
    bit<WORDSIZE> n2n_16_weight_10;
    bit<WORDSIZE> n2n_16_weight_11;
    bit<WORDSIZE> n2n_16_weight_12;
    bit<WORDSIZE> n2n_16_weight_13;
    bit<WORDSIZE> n2n_16_weight_14;
    bit<WORDSIZE> n2n_16_weight_15;
    bit<WORDSIZE> n2n_16_weight_16;
    bit<WORDSIZE> n2n_16_weight_17;
    bit<WORDSIZE> n2n_16_weight_18;
    bit<WORDSIZE> n2n_16_weight_19;
    bit<WORDSIZE> n2n_16_weight_20;
    bit<WORDSIZE> n2n_16_weight_21;
    bit<WORDSIZE> n2n_16_weight_22;
    bit<WORDSIZE> n2n_16_weight_23;
    bit<WORDSIZE> n2n_16_weight_24;
    bit<WORDSIZE> n2n_16_weight_25;
    bit<WORDSIZE> n2n_16_weight_26;
    bit<WORDSIZE> n2n_16_weight_27;
    bit<WORDSIZE> n2n_16_weight_28;
    bit<WORDSIZE> n2n_16_weight_29;
    bit<WORDSIZE> n2n_16_weight_30;
    bit<WORDSIZE> n2n_16_weight_31;
    bit<WORDSIZE> n2n_16_weight_32;
    bit<WORDSIZE> n2n_17_weight_1;
    bit<WORDSIZE> n2n_17_weight_2;
    bit<WORDSIZE> n2n_17_weight_3;
    bit<WORDSIZE> n2n_17_weight_4;
    bit<WORDSIZE> n2n_17_weight_5;
    bit<WORDSIZE> n2n_17_weight_6;
    bit<WORDSIZE> n2n_17_weight_7;
    bit<WORDSIZE> n2n_17_weight_8;
    bit<WORDSIZE> n2n_17_weight_9;
    bit<WORDSIZE> n2n_17_weight_10;
    bit<WORDSIZE> n2n_17_weight_11;
    bit<WORDSIZE> n2n_17_weight_12;
    bit<WORDSIZE> n2n_17_weight_13;
    bit<WORDSIZE> n2n_17_weight_14;
    bit<WORDSIZE> n2n_17_weight_15;
    bit<WORDSIZE> n2n_17_weight_16;
    bit<WORDSIZE> n2n_17_weight_17;
    bit<WORDSIZE> n2n_17_weight_18;
    bit<WORDSIZE> n2n_17_weight_19;
    bit<WORDSIZE> n2n_17_weight_20;
    bit<WORDSIZE> n2n_17_weight_21;
    bit<WORDSIZE> n2n_17_weight_22;
    bit<WORDSIZE> n2n_17_weight_23;
    bit<WORDSIZE> n2n_17_weight_24;
    bit<WORDSIZE> n2n_17_weight_25;
    bit<WORDSIZE> n2n_17_weight_26;
    bit<WORDSIZE> n2n_17_weight_27;
    bit<WORDSIZE> n2n_17_weight_28;
    bit<WORDSIZE> n2n_17_weight_29;
    bit<WORDSIZE> n2n_17_weight_30;
    bit<WORDSIZE> n2n_17_weight_31;
    bit<WORDSIZE> n2n_17_weight_32;
    bit<WORDSIZE> n2n_18_weight_1;
    bit<WORDSIZE> n2n_18_weight_2;
    bit<WORDSIZE> n2n_18_weight_3;
    bit<WORDSIZE> n2n_18_weight_4;
    bit<WORDSIZE> n2n_18_weight_5;
    bit<WORDSIZE> n2n_18_weight_6;
    bit<WORDSIZE> n2n_18_weight_7;
    bit<WORDSIZE> n2n_18_weight_8;
    bit<WORDSIZE> n2n_18_weight_9;
    bit<WORDSIZE> n2n_18_weight_10;
    bit<WORDSIZE> n2n_18_weight_11;
    bit<WORDSIZE> n2n_18_weight_12;
    bit<WORDSIZE> n2n_18_weight_13;
    bit<WORDSIZE> n2n_18_weight_14;
    bit<WORDSIZE> n2n_18_weight_15;
    bit<WORDSIZE> n2n_18_weight_16;
    bit<WORDSIZE> n2n_18_weight_17;
    bit<WORDSIZE> n2n_18_weight_18;
    bit<WORDSIZE> n2n_18_weight_19;
    bit<WORDSIZE> n2n_18_weight_20;
    bit<WORDSIZE> n2n_18_weight_21;
    bit<WORDSIZE> n2n_18_weight_22;
    bit<WORDSIZE> n2n_18_weight_23;
    bit<WORDSIZE> n2n_18_weight_24;
    bit<WORDSIZE> n2n_18_weight_25;
    bit<WORDSIZE> n2n_18_weight_26;
    bit<WORDSIZE> n2n_18_weight_27;
    bit<WORDSIZE> n2n_18_weight_28;
    bit<WORDSIZE> n2n_18_weight_29;
    bit<WORDSIZE> n2n_18_weight_30;
    bit<WORDSIZE> n2n_18_weight_31;
    bit<WORDSIZE> n2n_18_weight_32;
    bit<WORDSIZE> n2n_19_weight_1;
    bit<WORDSIZE> n2n_19_weight_2;
    bit<WORDSIZE> n2n_19_weight_3;
    bit<WORDSIZE> n2n_19_weight_4;
    bit<WORDSIZE> n2n_19_weight_5;
    bit<WORDSIZE> n2n_19_weight_6;
    bit<WORDSIZE> n2n_19_weight_7;
    bit<WORDSIZE> n2n_19_weight_8;
    bit<WORDSIZE> n2n_19_weight_9;
    bit<WORDSIZE> n2n_19_weight_10;
    bit<WORDSIZE> n2n_19_weight_11;
    bit<WORDSIZE> n2n_19_weight_12;
    bit<WORDSIZE> n2n_19_weight_13;
    bit<WORDSIZE> n2n_19_weight_14;
    bit<WORDSIZE> n2n_19_weight_15;
    bit<WORDSIZE> n2n_19_weight_16;
    bit<WORDSIZE> n2n_19_weight_17;
    bit<WORDSIZE> n2n_19_weight_18;
    bit<WORDSIZE> n2n_19_weight_19;
    bit<WORDSIZE> n2n_19_weight_20;
    bit<WORDSIZE> n2n_19_weight_21;
    bit<WORDSIZE> n2n_19_weight_22;
    bit<WORDSIZE> n2n_19_weight_23;
    bit<WORDSIZE> n2n_19_weight_24;
    bit<WORDSIZE> n2n_19_weight_25;
    bit<WORDSIZE> n2n_19_weight_26;
    bit<WORDSIZE> n2n_19_weight_27;
    bit<WORDSIZE> n2n_19_weight_28;
    bit<WORDSIZE> n2n_19_weight_29;
    bit<WORDSIZE> n2n_19_weight_30;
    bit<WORDSIZE> n2n_19_weight_31;
    bit<WORDSIZE> n2n_19_weight_32;
    bit<WORDSIZE> n2n_20_weight_1;
    bit<WORDSIZE> n2n_20_weight_2;
    bit<WORDSIZE> n2n_20_weight_3;
    bit<WORDSIZE> n2n_20_weight_4;
    bit<WORDSIZE> n2n_20_weight_5;
    bit<WORDSIZE> n2n_20_weight_6;
    bit<WORDSIZE> n2n_20_weight_7;
    bit<WORDSIZE> n2n_20_weight_8;
    bit<WORDSIZE> n2n_20_weight_9;
    bit<WORDSIZE> n2n_20_weight_10;
    bit<WORDSIZE> n2n_20_weight_11;
    bit<WORDSIZE> n2n_20_weight_12;
    bit<WORDSIZE> n2n_20_weight_13;
    bit<WORDSIZE> n2n_20_weight_14;
    bit<WORDSIZE> n2n_20_weight_15;
    bit<WORDSIZE> n2n_20_weight_16;
    bit<WORDSIZE> n2n_20_weight_17;
    bit<WORDSIZE> n2n_20_weight_18;
    bit<WORDSIZE> n2n_20_weight_19;
    bit<WORDSIZE> n2n_20_weight_20;
    bit<WORDSIZE> n2n_20_weight_21;
    bit<WORDSIZE> n2n_20_weight_22;
    bit<WORDSIZE> n2n_20_weight_23;
    bit<WORDSIZE> n2n_20_weight_24;
    bit<WORDSIZE> n2n_20_weight_25;
    bit<WORDSIZE> n2n_20_weight_26;
    bit<WORDSIZE> n2n_20_weight_27;
    bit<WORDSIZE> n2n_20_weight_28;
    bit<WORDSIZE> n2n_20_weight_29;
    bit<WORDSIZE> n2n_20_weight_30;
    bit<WORDSIZE> n2n_20_weight_31;
    bit<WORDSIZE> n2n_20_weight_32;
    bit<WORDSIZE> n2n_21_weight_1;
    bit<WORDSIZE> n2n_21_weight_2;
    bit<WORDSIZE> n2n_21_weight_3;
    bit<WORDSIZE> n2n_21_weight_4;
    bit<WORDSIZE> n2n_21_weight_5;
    bit<WORDSIZE> n2n_21_weight_6;
    bit<WORDSIZE> n2n_21_weight_7;
    bit<WORDSIZE> n2n_21_weight_8;
    bit<WORDSIZE> n2n_21_weight_9;
    bit<WORDSIZE> n2n_21_weight_10;
    bit<WORDSIZE> n2n_21_weight_11;
    bit<WORDSIZE> n2n_21_weight_12;
    bit<WORDSIZE> n2n_21_weight_13;
    bit<WORDSIZE> n2n_21_weight_14;
    bit<WORDSIZE> n2n_21_weight_15;
    bit<WORDSIZE> n2n_21_weight_16;
    bit<WORDSIZE> n2n_21_weight_17;
    bit<WORDSIZE> n2n_21_weight_18;
    bit<WORDSIZE> n2n_21_weight_19;
    bit<WORDSIZE> n2n_21_weight_20;
    bit<WORDSIZE> n2n_21_weight_21;
    bit<WORDSIZE> n2n_21_weight_22;
    bit<WORDSIZE> n2n_21_weight_23;
    bit<WORDSIZE> n2n_21_weight_24;
    bit<WORDSIZE> n2n_21_weight_25;
    bit<WORDSIZE> n2n_21_weight_26;
    bit<WORDSIZE> n2n_21_weight_27;
    bit<WORDSIZE> n2n_21_weight_28;
    bit<WORDSIZE> n2n_21_weight_29;
    bit<WORDSIZE> n2n_21_weight_30;
    bit<WORDSIZE> n2n_21_weight_31;
    bit<WORDSIZE> n2n_21_weight_32;
    bit<WORDSIZE> n2n_22_weight_1;
    bit<WORDSIZE> n2n_22_weight_2;
    bit<WORDSIZE> n2n_22_weight_3;
    bit<WORDSIZE> n2n_22_weight_4;
    bit<WORDSIZE> n2n_22_weight_5;
    bit<WORDSIZE> n2n_22_weight_6;
    bit<WORDSIZE> n2n_22_weight_7;
    bit<WORDSIZE> n2n_22_weight_8;
    bit<WORDSIZE> n2n_22_weight_9;
    bit<WORDSIZE> n2n_22_weight_10;
    bit<WORDSIZE> n2n_22_weight_11;
    bit<WORDSIZE> n2n_22_weight_12;
    bit<WORDSIZE> n2n_22_weight_13;
    bit<WORDSIZE> n2n_22_weight_14;
    bit<WORDSIZE> n2n_22_weight_15;
    bit<WORDSIZE> n2n_22_weight_16;
    bit<WORDSIZE> n2n_22_weight_17;
    bit<WORDSIZE> n2n_22_weight_18;
    bit<WORDSIZE> n2n_22_weight_19;
    bit<WORDSIZE> n2n_22_weight_20;
    bit<WORDSIZE> n2n_22_weight_21;
    bit<WORDSIZE> n2n_22_weight_22;
    bit<WORDSIZE> n2n_22_weight_23;
    bit<WORDSIZE> n2n_22_weight_24;
    bit<WORDSIZE> n2n_22_weight_25;
    bit<WORDSIZE> n2n_22_weight_26;
    bit<WORDSIZE> n2n_22_weight_27;
    bit<WORDSIZE> n2n_22_weight_28;
    bit<WORDSIZE> n2n_22_weight_29;
    bit<WORDSIZE> n2n_22_weight_30;
    bit<WORDSIZE> n2n_22_weight_31;
    bit<WORDSIZE> n2n_22_weight_32;
    bit<WORDSIZE> n2n_23_weight_1;
    bit<WORDSIZE> n2n_23_weight_2;
    bit<WORDSIZE> n2n_23_weight_3;
    bit<WORDSIZE> n2n_23_weight_4;
    bit<WORDSIZE> n2n_23_weight_5;
    bit<WORDSIZE> n2n_23_weight_6;
    bit<WORDSIZE> n2n_23_weight_7;
    bit<WORDSIZE> n2n_23_weight_8;
    bit<WORDSIZE> n2n_23_weight_9;
    bit<WORDSIZE> n2n_23_weight_10;
    bit<WORDSIZE> n2n_23_weight_11;
    bit<WORDSIZE> n2n_23_weight_12;
    bit<WORDSIZE> n2n_23_weight_13;
    bit<WORDSIZE> n2n_23_weight_14;
    bit<WORDSIZE> n2n_23_weight_15;
    bit<WORDSIZE> n2n_23_weight_16;
    bit<WORDSIZE> n2n_23_weight_17;
    bit<WORDSIZE> n2n_23_weight_18;
    bit<WORDSIZE> n2n_23_weight_19;
    bit<WORDSIZE> n2n_23_weight_20;
    bit<WORDSIZE> n2n_23_weight_21;
    bit<WORDSIZE> n2n_23_weight_22;
    bit<WORDSIZE> n2n_23_weight_23;
    bit<WORDSIZE> n2n_23_weight_24;
    bit<WORDSIZE> n2n_23_weight_25;
    bit<WORDSIZE> n2n_23_weight_26;
    bit<WORDSIZE> n2n_23_weight_27;
    bit<WORDSIZE> n2n_23_weight_28;
    bit<WORDSIZE> n2n_23_weight_29;
    bit<WORDSIZE> n2n_23_weight_30;
    bit<WORDSIZE> n2n_23_weight_31;
    bit<WORDSIZE> n2n_23_weight_32;
    bit<WORDSIZE> n2n_24_weight_1;
    bit<WORDSIZE> n2n_24_weight_2;
    bit<WORDSIZE> n2n_24_weight_3;
    bit<WORDSIZE> n2n_24_weight_4;
    bit<WORDSIZE> n2n_24_weight_5;
    bit<WORDSIZE> n2n_24_weight_6;
    bit<WORDSIZE> n2n_24_weight_7;
    bit<WORDSIZE> n2n_24_weight_8;
    bit<WORDSIZE> n2n_24_weight_9;
    bit<WORDSIZE> n2n_24_weight_10;
    bit<WORDSIZE> n2n_24_weight_11;
    bit<WORDSIZE> n2n_24_weight_12;
    bit<WORDSIZE> n2n_24_weight_13;
    bit<WORDSIZE> n2n_24_weight_14;
    bit<WORDSIZE> n2n_24_weight_15;
    bit<WORDSIZE> n2n_24_weight_16;
    bit<WORDSIZE> n2n_24_weight_17;
    bit<WORDSIZE> n2n_24_weight_18;
    bit<WORDSIZE> n2n_24_weight_19;
    bit<WORDSIZE> n2n_24_weight_20;
    bit<WORDSIZE> n2n_24_weight_21;
    bit<WORDSIZE> n2n_24_weight_22;
    bit<WORDSIZE> n2n_24_weight_23;
    bit<WORDSIZE> n2n_24_weight_24;
    bit<WORDSIZE> n2n_24_weight_25;
    bit<WORDSIZE> n2n_24_weight_26;
    bit<WORDSIZE> n2n_24_weight_27;
    bit<WORDSIZE> n2n_24_weight_28;
    bit<WORDSIZE> n2n_24_weight_29;
    bit<WORDSIZE> n2n_24_weight_30;
    bit<WORDSIZE> n2n_24_weight_31;
    bit<WORDSIZE> n2n_24_weight_32;
    bit<WORDSIZE> n2n_25_weight_1;
    bit<WORDSIZE> n2n_25_weight_2;
    bit<WORDSIZE> n2n_25_weight_3;
    bit<WORDSIZE> n2n_25_weight_4;
    bit<WORDSIZE> n2n_25_weight_5;
    bit<WORDSIZE> n2n_25_weight_6;
    bit<WORDSIZE> n2n_25_weight_7;
    bit<WORDSIZE> n2n_25_weight_8;
    bit<WORDSIZE> n2n_25_weight_9;
    bit<WORDSIZE> n2n_25_weight_10;
    bit<WORDSIZE> n2n_25_weight_11;
    bit<WORDSIZE> n2n_25_weight_12;
    bit<WORDSIZE> n2n_25_weight_13;
    bit<WORDSIZE> n2n_25_weight_14;
    bit<WORDSIZE> n2n_25_weight_15;
    bit<WORDSIZE> n2n_25_weight_16;
    bit<WORDSIZE> n2n_25_weight_17;
    bit<WORDSIZE> n2n_25_weight_18;
    bit<WORDSIZE> n2n_25_weight_19;
    bit<WORDSIZE> n2n_25_weight_20;
    bit<WORDSIZE> n2n_25_weight_21;
    bit<WORDSIZE> n2n_25_weight_22;
    bit<WORDSIZE> n2n_25_weight_23;
    bit<WORDSIZE> n2n_25_weight_24;
    bit<WORDSIZE> n2n_25_weight_25;
    bit<WORDSIZE> n2n_25_weight_26;
    bit<WORDSIZE> n2n_25_weight_27;
    bit<WORDSIZE> n2n_25_weight_28;
    bit<WORDSIZE> n2n_25_weight_29;
    bit<WORDSIZE> n2n_25_weight_30;
    bit<WORDSIZE> n2n_25_weight_31;
    bit<WORDSIZE> n2n_25_weight_32;
    bit<WORDSIZE> n2n_26_weight_1;
    bit<WORDSIZE> n2n_26_weight_2;
    bit<WORDSIZE> n2n_26_weight_3;
    bit<WORDSIZE> n2n_26_weight_4;
    bit<WORDSIZE> n2n_26_weight_5;
    bit<WORDSIZE> n2n_26_weight_6;
    bit<WORDSIZE> n2n_26_weight_7;
    bit<WORDSIZE> n2n_26_weight_8;
    bit<WORDSIZE> n2n_26_weight_9;
    bit<WORDSIZE> n2n_26_weight_10;
    bit<WORDSIZE> n2n_26_weight_11;
    bit<WORDSIZE> n2n_26_weight_12;
    bit<WORDSIZE> n2n_26_weight_13;
    bit<WORDSIZE> n2n_26_weight_14;
    bit<WORDSIZE> n2n_26_weight_15;
    bit<WORDSIZE> n2n_26_weight_16;
    bit<WORDSIZE> n2n_26_weight_17;
    bit<WORDSIZE> n2n_26_weight_18;
    bit<WORDSIZE> n2n_26_weight_19;
    bit<WORDSIZE> n2n_26_weight_20;
    bit<WORDSIZE> n2n_26_weight_21;
    bit<WORDSIZE> n2n_26_weight_22;
    bit<WORDSIZE> n2n_26_weight_23;
    bit<WORDSIZE> n2n_26_weight_24;
    bit<WORDSIZE> n2n_26_weight_25;
    bit<WORDSIZE> n2n_26_weight_26;
    bit<WORDSIZE> n2n_26_weight_27;
    bit<WORDSIZE> n2n_26_weight_28;
    bit<WORDSIZE> n2n_26_weight_29;
    bit<WORDSIZE> n2n_26_weight_30;
    bit<WORDSIZE> n2n_26_weight_31;
    bit<WORDSIZE> n2n_26_weight_32;
    bit<WORDSIZE> n2n_27_weight_1;
    bit<WORDSIZE> n2n_27_weight_2;
    bit<WORDSIZE> n2n_27_weight_3;
    bit<WORDSIZE> n2n_27_weight_4;
    bit<WORDSIZE> n2n_27_weight_5;
    bit<WORDSIZE> n2n_27_weight_6;
    bit<WORDSIZE> n2n_27_weight_7;
    bit<WORDSIZE> n2n_27_weight_8;
    bit<WORDSIZE> n2n_27_weight_9;
    bit<WORDSIZE> n2n_27_weight_10;
    bit<WORDSIZE> n2n_27_weight_11;
    bit<WORDSIZE> n2n_27_weight_12;
    bit<WORDSIZE> n2n_27_weight_13;
    bit<WORDSIZE> n2n_27_weight_14;
    bit<WORDSIZE> n2n_27_weight_15;
    bit<WORDSIZE> n2n_27_weight_16;
    bit<WORDSIZE> n2n_27_weight_17;
    bit<WORDSIZE> n2n_27_weight_18;
    bit<WORDSIZE> n2n_27_weight_19;
    bit<WORDSIZE> n2n_27_weight_20;
    bit<WORDSIZE> n2n_27_weight_21;
    bit<WORDSIZE> n2n_27_weight_22;
    bit<WORDSIZE> n2n_27_weight_23;
    bit<WORDSIZE> n2n_27_weight_24;
    bit<WORDSIZE> n2n_27_weight_25;
    bit<WORDSIZE> n2n_27_weight_26;
    bit<WORDSIZE> n2n_27_weight_27;
    bit<WORDSIZE> n2n_27_weight_28;
    bit<WORDSIZE> n2n_27_weight_29;
    bit<WORDSIZE> n2n_27_weight_30;
    bit<WORDSIZE> n2n_27_weight_31;
    bit<WORDSIZE> n2n_27_weight_32;
    bit<WORDSIZE> n2n_28_weight_1;
    bit<WORDSIZE> n2n_28_weight_2;
    bit<WORDSIZE> n2n_28_weight_3;
    bit<WORDSIZE> n2n_28_weight_4;
    bit<WORDSIZE> n2n_28_weight_5;
    bit<WORDSIZE> n2n_28_weight_6;
    bit<WORDSIZE> n2n_28_weight_7;
    bit<WORDSIZE> n2n_28_weight_8;
    bit<WORDSIZE> n2n_28_weight_9;
    bit<WORDSIZE> n2n_28_weight_10;
    bit<WORDSIZE> n2n_28_weight_11;
    bit<WORDSIZE> n2n_28_weight_12;
    bit<WORDSIZE> n2n_28_weight_13;
    bit<WORDSIZE> n2n_28_weight_14;
    bit<WORDSIZE> n2n_28_weight_15;
    bit<WORDSIZE> n2n_28_weight_16;
    bit<WORDSIZE> n2n_28_weight_17;
    bit<WORDSIZE> n2n_28_weight_18;
    bit<WORDSIZE> n2n_28_weight_19;
    bit<WORDSIZE> n2n_28_weight_20;
    bit<WORDSIZE> n2n_28_weight_21;
    bit<WORDSIZE> n2n_28_weight_22;
    bit<WORDSIZE> n2n_28_weight_23;
    bit<WORDSIZE> n2n_28_weight_24;
    bit<WORDSIZE> n2n_28_weight_25;
    bit<WORDSIZE> n2n_28_weight_26;
    bit<WORDSIZE> n2n_28_weight_27;
    bit<WORDSIZE> n2n_28_weight_28;
    bit<WORDSIZE> n2n_28_weight_29;
    bit<WORDSIZE> n2n_28_weight_30;
    bit<WORDSIZE> n2n_28_weight_31;
    bit<WORDSIZE> n2n_28_weight_32;
    bit<WORDSIZE> n2n_29_weight_1;
    bit<WORDSIZE> n2n_29_weight_2;
    bit<WORDSIZE> n2n_29_weight_3;
    bit<WORDSIZE> n2n_29_weight_4;
    bit<WORDSIZE> n2n_29_weight_5;
    bit<WORDSIZE> n2n_29_weight_6;
    bit<WORDSIZE> n2n_29_weight_7;
    bit<WORDSIZE> n2n_29_weight_8;
    bit<WORDSIZE> n2n_29_weight_9;
    bit<WORDSIZE> n2n_29_weight_10;
    bit<WORDSIZE> n2n_29_weight_11;
    bit<WORDSIZE> n2n_29_weight_12;
    bit<WORDSIZE> n2n_29_weight_13;
    bit<WORDSIZE> n2n_29_weight_14;
    bit<WORDSIZE> n2n_29_weight_15;
    bit<WORDSIZE> n2n_29_weight_16;
    bit<WORDSIZE> n2n_29_weight_17;
    bit<WORDSIZE> n2n_29_weight_18;
    bit<WORDSIZE> n2n_29_weight_19;
    bit<WORDSIZE> n2n_29_weight_20;
    bit<WORDSIZE> n2n_29_weight_21;
    bit<WORDSIZE> n2n_29_weight_22;
    bit<WORDSIZE> n2n_29_weight_23;
    bit<WORDSIZE> n2n_29_weight_24;
    bit<WORDSIZE> n2n_29_weight_25;
    bit<WORDSIZE> n2n_29_weight_26;
    bit<WORDSIZE> n2n_29_weight_27;
    bit<WORDSIZE> n2n_29_weight_28;
    bit<WORDSIZE> n2n_29_weight_29;
    bit<WORDSIZE> n2n_29_weight_30;
    bit<WORDSIZE> n2n_29_weight_31;
    bit<WORDSIZE> n2n_29_weight_32;
    bit<WORDSIZE> n2n_30_weight_1;
    bit<WORDSIZE> n2n_30_weight_2;
    bit<WORDSIZE> n2n_30_weight_3;
    bit<WORDSIZE> n2n_30_weight_4;
    bit<WORDSIZE> n2n_30_weight_5;
    bit<WORDSIZE> n2n_30_weight_6;
    bit<WORDSIZE> n2n_30_weight_7;
    bit<WORDSIZE> n2n_30_weight_8;
    bit<WORDSIZE> n2n_30_weight_9;
    bit<WORDSIZE> n2n_30_weight_10;
    bit<WORDSIZE> n2n_30_weight_11;
    bit<WORDSIZE> n2n_30_weight_12;
    bit<WORDSIZE> n2n_30_weight_13;
    bit<WORDSIZE> n2n_30_weight_14;
    bit<WORDSIZE> n2n_30_weight_15;
    bit<WORDSIZE> n2n_30_weight_16;
    bit<WORDSIZE> n2n_30_weight_17;
    bit<WORDSIZE> n2n_30_weight_18;
    bit<WORDSIZE> n2n_30_weight_19;
    bit<WORDSIZE> n2n_30_weight_20;
    bit<WORDSIZE> n2n_30_weight_21;
    bit<WORDSIZE> n2n_30_weight_22;
    bit<WORDSIZE> n2n_30_weight_23;
    bit<WORDSIZE> n2n_30_weight_24;
    bit<WORDSIZE> n2n_30_weight_25;
    bit<WORDSIZE> n2n_30_weight_26;
    bit<WORDSIZE> n2n_30_weight_27;
    bit<WORDSIZE> n2n_30_weight_28;
    bit<WORDSIZE> n2n_30_weight_29;
    bit<WORDSIZE> n2n_30_weight_30;
    bit<WORDSIZE> n2n_30_weight_31;
    bit<WORDSIZE> n2n_30_weight_32;
    bit<WORDSIZE> n2n_31_weight_1;
    bit<WORDSIZE> n2n_31_weight_2;
    bit<WORDSIZE> n2n_31_weight_3;
    bit<WORDSIZE> n2n_31_weight_4;
    bit<WORDSIZE> n2n_31_weight_5;
    bit<WORDSIZE> n2n_31_weight_6;
    bit<WORDSIZE> n2n_31_weight_7;
    bit<WORDSIZE> n2n_31_weight_8;
    bit<WORDSIZE> n2n_31_weight_9;
    bit<WORDSIZE> n2n_31_weight_10;
    bit<WORDSIZE> n2n_31_weight_11;
    bit<WORDSIZE> n2n_31_weight_12;
    bit<WORDSIZE> n2n_31_weight_13;
    bit<WORDSIZE> n2n_31_weight_14;
    bit<WORDSIZE> n2n_31_weight_15;
    bit<WORDSIZE> n2n_31_weight_16;
    bit<WORDSIZE> n2n_31_weight_17;
    bit<WORDSIZE> n2n_31_weight_18;
    bit<WORDSIZE> n2n_31_weight_19;
    bit<WORDSIZE> n2n_31_weight_20;
    bit<WORDSIZE> n2n_31_weight_21;
    bit<WORDSIZE> n2n_31_weight_22;
    bit<WORDSIZE> n2n_31_weight_23;
    bit<WORDSIZE> n2n_31_weight_24;
    bit<WORDSIZE> n2n_31_weight_25;
    bit<WORDSIZE> n2n_31_weight_26;
    bit<WORDSIZE> n2n_31_weight_27;
    bit<WORDSIZE> n2n_31_weight_28;
    bit<WORDSIZE> n2n_31_weight_29;
    bit<WORDSIZE> n2n_31_weight_30;
    bit<WORDSIZE> n2n_31_weight_31;
    bit<WORDSIZE> n2n_31_weight_32;
    bit<WORDSIZE> n2n_32_weight_1;
    bit<WORDSIZE> n2n_32_weight_2;
    bit<WORDSIZE> n2n_32_weight_3;
    bit<WORDSIZE> n2n_32_weight_4;
    bit<WORDSIZE> n2n_32_weight_5;
    bit<WORDSIZE> n2n_32_weight_6;
    bit<WORDSIZE> n2n_32_weight_7;
    bit<WORDSIZE> n2n_32_weight_8;
    bit<WORDSIZE> n2n_32_weight_9;
    bit<WORDSIZE> n2n_32_weight_10;
    bit<WORDSIZE> n2n_32_weight_11;
    bit<WORDSIZE> n2n_32_weight_12;
    bit<WORDSIZE> n2n_32_weight_13;
    bit<WORDSIZE> n2n_32_weight_14;
    bit<WORDSIZE> n2n_32_weight_15;
    bit<WORDSIZE> n2n_32_weight_16;
    bit<WORDSIZE> n2n_32_weight_17;
    bit<WORDSIZE> n2n_32_weight_18;
    bit<WORDSIZE> n2n_32_weight_19;
    bit<WORDSIZE> n2n_32_weight_20;
    bit<WORDSIZE> n2n_32_weight_21;
    bit<WORDSIZE> n2n_32_weight_22;
    bit<WORDSIZE> n2n_32_weight_23;
    bit<WORDSIZE> n2n_32_weight_24;
    bit<WORDSIZE> n2n_32_weight_25;
    bit<WORDSIZE> n2n_32_weight_26;
    bit<WORDSIZE> n2n_32_weight_27;
    bit<WORDSIZE> n2n_32_weight_28;
    bit<WORDSIZE> n2n_32_weight_29;
    bit<WORDSIZE> n2n_32_weight_30;
    bit<WORDSIZE> n2n_32_weight_31;
    bit<WORDSIZE> n2n_32_weight_32;

// Agg func = argmax
    bit<WORDSIZE> neuron_max_value;
}

struct headers{
    ethernet_t   ethernet;
    ann_t   ann;
}

/*************************************************************************
*********************** P A R S E R  ***********************************
*************************************************************************/

parser MyParser(packet_in packet,
            out headers hdr,
            inout metadata meta,
            inout standard_metadata_t standard_metadata){

    state start{
        transition parse_ethernet;
    }

    state parse_ethernet{
        packet.extract(hdr.ethernet);
        transition select(hdr.ethernet.etherType){
           ET_ANN: parse_ann;
           default: accept;
        }
    }

    state parse_ann{
      packet.extract(hdr.ann);
      transition accept;
    }
}

/*************************************************************************
************   C H E C K S U M    V E R I F I C A T I O N   *************
*************************************************************************/

control MyVerifyChecksum(inout headers hdr, inout metadata meta){
    apply {  }
}

/*************************************************************************
**************  I N G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control MyIngress(inout headers hdr,
                inout metadata meta,
                inout standard_metadata_t standard_metadata) {

    register<bit<32>>(1) reg_n_received_stimuli;
    register<bit<128>>(1) reg_received_stimuli;
    register<bit<WORDSIZE>>(1) reg_neuron_1_data;
    register<bit<WORDSIZE>>(1) reg_neuron_2_data;
    register<bit<WORDSIZE>>(1) reg_neuron_3_data;
    register<bit<WORDSIZE>>(1) reg_neuron_4_data;
    register<bit<WORDSIZE>>(1) reg_neuron_5_data;
    register<bit<WORDSIZE>>(1) reg_neuron_6_data;
    register<bit<WORDSIZE>>(1) reg_neuron_7_data;
    register<bit<WORDSIZE>>(1) reg_neuron_8_data;
    register<bit<WORDSIZE>>(1) reg_neuron_9_data;
    register<bit<WORDSIZE>>(1) reg_neuron_10_data;
    register<bit<WORDSIZE>>(1) reg_neuron_11_data;
    register<bit<WORDSIZE>>(1) reg_neuron_12_data;
    register<bit<WORDSIZE>>(1) reg_neuron_13_data;
    register<bit<WORDSIZE>>(1) reg_neuron_14_data;
    register<bit<WORDSIZE>>(1) reg_neuron_15_data;
    register<bit<WORDSIZE>>(1) reg_neuron_16_data;
    register<bit<WORDSIZE>>(1) reg_neuron_17_data;
    register<bit<WORDSIZE>>(1) reg_neuron_18_data;
    register<bit<WORDSIZE>>(1) reg_neuron_19_data;
    register<bit<WORDSIZE>>(1) reg_neuron_20_data;
    register<bit<WORDSIZE>>(1) reg_neuron_21_data;
    register<bit<WORDSIZE>>(1) reg_neuron_22_data;
    register<bit<WORDSIZE>>(1) reg_neuron_23_data;
    register<bit<WORDSIZE>>(1) reg_neuron_24_data;
    register<bit<WORDSIZE>>(1) reg_neuron_25_data;
    register<bit<WORDSIZE>>(1) reg_neuron_26_data;
    register<bit<WORDSIZE>>(1) reg_neuron_27_data;
    register<bit<WORDSIZE>>(1) reg_neuron_28_data;
    register<bit<WORDSIZE>>(1) reg_neuron_29_data;
    register<bit<WORDSIZE>>(1) reg_neuron_30_data;
    register<bit<WORDSIZE>>(1) reg_neuron_31_data;
    register<bit<WORDSIZE>>(1) reg_neuron_32_data;

    register<bit<WORDSIZE>>(1) reg_neuron_max_value;
    register<bit<16>>(1) reg_run_id;
    action drop(){
    mark_to_drop(standard_metadata);
}

action mcast(bit<16> mgroup){
    standard_metadata.mcast_grp = mgroup;
}

table ann_forward{
    key = {
        standard_metadata.ingress_port: exact;
    }
    actions = {
        mcast;
        drop;
    }
    size = 1024;
    default_action = drop();
}

action set_neuron_id(bit<32> neuron_id){
    meta.neuron_id = neuron_id;
}

table tab_neuron_id{
    actions = {
        set_neuron_id;
    }
    size = 1;
}

action set_n_expected_stimuli(bit<32> n_expected_stimuli){
    meta.n_expected_stimuli = n_expected_stimuli;
}

table tab_n_expected_stimuli{
    actions = {
        set_n_expected_stimuli;
    }
    size = 1;
}

action set_expected_stimuli(bit<128> expected_stimuli){
    meta.expected_stimuli = expected_stimuli;
}

table tab_expected_stimuli{
    actions = {
        set_expected_stimuli;
    }
    size = 1;
}

action set_agg_func(bit<32> agg_func){
    meta.agg_func = agg_func;
}

table tab_agg_func{
    actions = {
        set_agg_func;
    }
    size = 1;
}


action set_neuron_bias_32_neurons(bit<WORDSIZE> neuron_1_bias, bit<WORDSIZE> neuron_2_bias, bit<WORDSIZE> neuron_3_bias, bit<WORDSIZE> neuron_4_bias, bit<WORDSIZE> neuron_5_bias, bit<WORDSIZE> neuron_6_bias, bit<WORDSIZE> neuron_7_bias, bit<WORDSIZE> neuron_8_bias, bit<WORDSIZE> neuron_9_bias, bit<WORDSIZE> neuron_10_bias, bit<WORDSIZE> neuron_11_bias, bit<WORDSIZE> neuron_12_bias, bit<WORDSIZE> neuron_13_bias, bit<WORDSIZE> neuron_14_bias, bit<WORDSIZE> neuron_15_bias, bit<WORDSIZE> neuron_16_bias, bit<WORDSIZE> neuron_17_bias, bit<WORDSIZE> neuron_18_bias, bit<WORDSIZE> neuron_19_bias, bit<WORDSIZE> neuron_20_bias, bit<WORDSIZE> neuron_21_bias, bit<WORDSIZE> neuron_22_bias, bit<WORDSIZE> neuron_23_bias, bit<WORDSIZE> neuron_24_bias, bit<WORDSIZE> neuron_25_bias, bit<WORDSIZE> neuron_26_bias, bit<WORDSIZE> neuron_27_bias, bit<WORDSIZE> neuron_28_bias, bit<WORDSIZE> neuron_29_bias, bit<WORDSIZE> neuron_30_bias, bit<WORDSIZE> neuron_31_bias, bit<WORDSIZE> neuron_32_bias){
   meta.neuron_1_bias = neuron_1_bias;
   meta.neuron_2_bias = neuron_2_bias;
   meta.neuron_3_bias = neuron_3_bias;
   meta.neuron_4_bias = neuron_4_bias;
   meta.neuron_5_bias = neuron_5_bias;
   meta.neuron_6_bias = neuron_6_bias;
   meta.neuron_7_bias = neuron_7_bias;
   meta.neuron_8_bias = neuron_8_bias;
   meta.neuron_9_bias = neuron_9_bias;
   meta.neuron_10_bias = neuron_10_bias;
   meta.neuron_11_bias = neuron_11_bias;
   meta.neuron_12_bias = neuron_12_bias;
   meta.neuron_13_bias = neuron_13_bias;
   meta.neuron_14_bias = neuron_14_bias;
   meta.neuron_15_bias = neuron_15_bias;
   meta.neuron_16_bias = neuron_16_bias;
   meta.neuron_17_bias = neuron_17_bias;
   meta.neuron_18_bias = neuron_18_bias;
   meta.neuron_19_bias = neuron_19_bias;
   meta.neuron_20_bias = neuron_20_bias;
   meta.neuron_21_bias = neuron_21_bias;
   meta.neuron_22_bias = neuron_22_bias;
   meta.neuron_23_bias = neuron_23_bias;
   meta.neuron_24_bias = neuron_24_bias;
   meta.neuron_25_bias = neuron_25_bias;
   meta.neuron_26_bias = neuron_26_bias;
   meta.neuron_27_bias = neuron_27_bias;
   meta.neuron_28_bias = neuron_28_bias;
   meta.neuron_29_bias = neuron_29_bias;
   meta.neuron_30_bias = neuron_30_bias;
   meta.neuron_31_bias = neuron_31_bias;
   meta.neuron_32_bias = neuron_32_bias;
}

table tab_neuron_bias_32_neurons{
    actions = {
        set_neuron_bias_32_neurons;
    }
    size = 1;
}
action set_neuron_bias_3_neurons(bit<WORDSIZE> neuron_1_bias, bit<WORDSIZE> neuron_2_bias, bit<WORDSIZE> neuron_3_bias){
   meta.neuron_1_bias = neuron_1_bias;
   meta.neuron_2_bias = neuron_2_bias;
   meta.neuron_3_bias = neuron_3_bias;
}

table tab_neuron_bias_3_neurons{
    actions = {
        set_neuron_bias_3_neurons;
    }
    size = 1;
}

action set_n2n_weight_32_to_32_neurons(bit<WORDSIZE> n2n_1_weight_1, bit<WORDSIZE> n2n_1_weight_2, bit<WORDSIZE> n2n_1_weight_3, bit<WORDSIZE> n2n_1_weight_4, bit<WORDSIZE> n2n_1_weight_5, bit<WORDSIZE> n2n_1_weight_6, bit<WORDSIZE> n2n_1_weight_7, bit<WORDSIZE> n2n_1_weight_8, bit<WORDSIZE> n2n_1_weight_9, bit<WORDSIZE> n2n_1_weight_10, bit<WORDSIZE> n2n_1_weight_11, bit<WORDSIZE> n2n_1_weight_12, bit<WORDSIZE> n2n_1_weight_13, bit<WORDSIZE> n2n_1_weight_14, bit<WORDSIZE> n2n_1_weight_15, bit<WORDSIZE> n2n_1_weight_16, bit<WORDSIZE> n2n_1_weight_17, bit<WORDSIZE> n2n_1_weight_18, bit<WORDSIZE> n2n_1_weight_19, bit<WORDSIZE> n2n_1_weight_20, bit<WORDSIZE> n2n_1_weight_21, bit<WORDSIZE> n2n_1_weight_22, bit<WORDSIZE> n2n_1_weight_23, bit<WORDSIZE> n2n_1_weight_24, bit<WORDSIZE> n2n_1_weight_25, bit<WORDSIZE> n2n_1_weight_26, bit<WORDSIZE> n2n_1_weight_27, bit<WORDSIZE> n2n_1_weight_28, bit<WORDSIZE> n2n_1_weight_29, bit<WORDSIZE> n2n_1_weight_30, bit<WORDSIZE> n2n_1_weight_31, bit<WORDSIZE> n2n_1_weight_32, bit<WORDSIZE> n2n_2_weight_1, bit<WORDSIZE> n2n_2_weight_2, bit<WORDSIZE> n2n_2_weight_3, bit<WORDSIZE> n2n_2_weight_4, bit<WORDSIZE> n2n_2_weight_5, bit<WORDSIZE> n2n_2_weight_6, bit<WORDSIZE> n2n_2_weight_7, bit<WORDSIZE> n2n_2_weight_8, bit<WORDSIZE> n2n_2_weight_9, bit<WORDSIZE> n2n_2_weight_10, bit<WORDSIZE> n2n_2_weight_11, bit<WORDSIZE> n2n_2_weight_12, bit<WORDSIZE> n2n_2_weight_13, bit<WORDSIZE> n2n_2_weight_14, bit<WORDSIZE> n2n_2_weight_15, bit<WORDSIZE> n2n_2_weight_16, bit<WORDSIZE> n2n_2_weight_17, bit<WORDSIZE> n2n_2_weight_18, bit<WORDSIZE> n2n_2_weight_19, bit<WORDSIZE> n2n_2_weight_20, bit<WORDSIZE> n2n_2_weight_21, bit<WORDSIZE> n2n_2_weight_22, bit<WORDSIZE> n2n_2_weight_23, bit<WORDSIZE> n2n_2_weight_24, bit<WORDSIZE> n2n_2_weight_25, bit<WORDSIZE> n2n_2_weight_26, bit<WORDSIZE> n2n_2_weight_27, bit<WORDSIZE> n2n_2_weight_28, bit<WORDSIZE> n2n_2_weight_29, bit<WORDSIZE> n2n_2_weight_30, bit<WORDSIZE> n2n_2_weight_31, bit<WORDSIZE> n2n_2_weight_32, bit<WORDSIZE> n2n_3_weight_1, bit<WORDSIZE> n2n_3_weight_2, bit<WORDSIZE> n2n_3_weight_3, bit<WORDSIZE> n2n_3_weight_4, bit<WORDSIZE> n2n_3_weight_5, bit<WORDSIZE> n2n_3_weight_6, bit<WORDSIZE> n2n_3_weight_7, bit<WORDSIZE> n2n_3_weight_8, bit<WORDSIZE> n2n_3_weight_9, bit<WORDSIZE> n2n_3_weight_10, bit<WORDSIZE> n2n_3_weight_11, bit<WORDSIZE> n2n_3_weight_12, bit<WORDSIZE> n2n_3_weight_13, bit<WORDSIZE> n2n_3_weight_14, bit<WORDSIZE> n2n_3_weight_15, bit<WORDSIZE> n2n_3_weight_16, bit<WORDSIZE> n2n_3_weight_17, bit<WORDSIZE> n2n_3_weight_18, bit<WORDSIZE> n2n_3_weight_19, bit<WORDSIZE> n2n_3_weight_20, bit<WORDSIZE> n2n_3_weight_21, bit<WORDSIZE> n2n_3_weight_22, bit<WORDSIZE> n2n_3_weight_23, bit<WORDSIZE> n2n_3_weight_24, bit<WORDSIZE> n2n_3_weight_25, bit<WORDSIZE> n2n_3_weight_26, bit<WORDSIZE> n2n_3_weight_27, bit<WORDSIZE> n2n_3_weight_28, bit<WORDSIZE> n2n_3_weight_29, bit<WORDSIZE> n2n_3_weight_30, bit<WORDSIZE> n2n_3_weight_31, bit<WORDSIZE> n2n_3_weight_32, bit<WORDSIZE> n2n_4_weight_1, bit<WORDSIZE> n2n_4_weight_2, bit<WORDSIZE> n2n_4_weight_3, bit<WORDSIZE> n2n_4_weight_4, bit<WORDSIZE> n2n_4_weight_5, bit<WORDSIZE> n2n_4_weight_6, bit<WORDSIZE> n2n_4_weight_7, bit<WORDSIZE> n2n_4_weight_8, bit<WORDSIZE> n2n_4_weight_9, bit<WORDSIZE> n2n_4_weight_10, bit<WORDSIZE> n2n_4_weight_11, bit<WORDSIZE> n2n_4_weight_12, bit<WORDSIZE> n2n_4_weight_13, bit<WORDSIZE> n2n_4_weight_14, bit<WORDSIZE> n2n_4_weight_15, bit<WORDSIZE> n2n_4_weight_16, bit<WORDSIZE> n2n_4_weight_17, bit<WORDSIZE> n2n_4_weight_18, bit<WORDSIZE> n2n_4_weight_19, bit<WORDSIZE> n2n_4_weight_20, bit<WORDSIZE> n2n_4_weight_21, bit<WORDSIZE> n2n_4_weight_22, bit<WORDSIZE> n2n_4_weight_23, bit<WORDSIZE> n2n_4_weight_24, bit<WORDSIZE> n2n_4_weight_25, bit<WORDSIZE> n2n_4_weight_26, bit<WORDSIZE> n2n_4_weight_27, bit<WORDSIZE> n2n_4_weight_28, bit<WORDSIZE> n2n_4_weight_29, bit<WORDSIZE> n2n_4_weight_30, bit<WORDSIZE> n2n_4_weight_31, bit<WORDSIZE> n2n_4_weight_32, bit<WORDSIZE> n2n_5_weight_1, bit<WORDSIZE> n2n_5_weight_2, bit<WORDSIZE> n2n_5_weight_3, bit<WORDSIZE> n2n_5_weight_4, bit<WORDSIZE> n2n_5_weight_5, bit<WORDSIZE> n2n_5_weight_6, bit<WORDSIZE> n2n_5_weight_7, bit<WORDSIZE> n2n_5_weight_8, bit<WORDSIZE> n2n_5_weight_9, bit<WORDSIZE> n2n_5_weight_10, bit<WORDSIZE> n2n_5_weight_11, bit<WORDSIZE> n2n_5_weight_12, bit<WORDSIZE> n2n_5_weight_13, bit<WORDSIZE> n2n_5_weight_14, bit<WORDSIZE> n2n_5_weight_15, bit<WORDSIZE> n2n_5_weight_16, bit<WORDSIZE> n2n_5_weight_17, bit<WORDSIZE> n2n_5_weight_18, bit<WORDSIZE> n2n_5_weight_19, bit<WORDSIZE> n2n_5_weight_20, bit<WORDSIZE> n2n_5_weight_21, bit<WORDSIZE> n2n_5_weight_22, bit<WORDSIZE> n2n_5_weight_23, bit<WORDSIZE> n2n_5_weight_24, bit<WORDSIZE> n2n_5_weight_25, bit<WORDSIZE> n2n_5_weight_26, bit<WORDSIZE> n2n_5_weight_27, bit<WORDSIZE> n2n_5_weight_28, bit<WORDSIZE> n2n_5_weight_29, bit<WORDSIZE> n2n_5_weight_30, bit<WORDSIZE> n2n_5_weight_31, bit<WORDSIZE> n2n_5_weight_32, bit<WORDSIZE> n2n_6_weight_1, bit<WORDSIZE> n2n_6_weight_2, bit<WORDSIZE> n2n_6_weight_3, bit<WORDSIZE> n2n_6_weight_4, bit<WORDSIZE> n2n_6_weight_5, bit<WORDSIZE> n2n_6_weight_6, bit<WORDSIZE> n2n_6_weight_7, bit<WORDSIZE> n2n_6_weight_8, bit<WORDSIZE> n2n_6_weight_9, bit<WORDSIZE> n2n_6_weight_10, bit<WORDSIZE> n2n_6_weight_11, bit<WORDSIZE> n2n_6_weight_12, bit<WORDSIZE> n2n_6_weight_13, bit<WORDSIZE> n2n_6_weight_14, bit<WORDSIZE> n2n_6_weight_15, bit<WORDSIZE> n2n_6_weight_16, bit<WORDSIZE> n2n_6_weight_17, bit<WORDSIZE> n2n_6_weight_18, bit<WORDSIZE> n2n_6_weight_19, bit<WORDSIZE> n2n_6_weight_20, bit<WORDSIZE> n2n_6_weight_21, bit<WORDSIZE> n2n_6_weight_22, bit<WORDSIZE> n2n_6_weight_23, bit<WORDSIZE> n2n_6_weight_24, bit<WORDSIZE> n2n_6_weight_25, bit<WORDSIZE> n2n_6_weight_26, bit<WORDSIZE> n2n_6_weight_27, bit<WORDSIZE> n2n_6_weight_28, bit<WORDSIZE> n2n_6_weight_29, bit<WORDSIZE> n2n_6_weight_30, bit<WORDSIZE> n2n_6_weight_31, bit<WORDSIZE> n2n_6_weight_32, bit<WORDSIZE> n2n_7_weight_1, bit<WORDSIZE> n2n_7_weight_2, bit<WORDSIZE> n2n_7_weight_3, bit<WORDSIZE> n2n_7_weight_4, bit<WORDSIZE> n2n_7_weight_5, bit<WORDSIZE> n2n_7_weight_6, bit<WORDSIZE> n2n_7_weight_7, bit<WORDSIZE> n2n_7_weight_8, bit<WORDSIZE> n2n_7_weight_9, bit<WORDSIZE> n2n_7_weight_10, bit<WORDSIZE> n2n_7_weight_11, bit<WORDSIZE> n2n_7_weight_12, bit<WORDSIZE> n2n_7_weight_13, bit<WORDSIZE> n2n_7_weight_14, bit<WORDSIZE> n2n_7_weight_15, bit<WORDSIZE> n2n_7_weight_16, bit<WORDSIZE> n2n_7_weight_17, bit<WORDSIZE> n2n_7_weight_18, bit<WORDSIZE> n2n_7_weight_19, bit<WORDSIZE> n2n_7_weight_20, bit<WORDSIZE> n2n_7_weight_21, bit<WORDSIZE> n2n_7_weight_22, bit<WORDSIZE> n2n_7_weight_23, bit<WORDSIZE> n2n_7_weight_24, bit<WORDSIZE> n2n_7_weight_25, bit<WORDSIZE> n2n_7_weight_26, bit<WORDSIZE> n2n_7_weight_27, bit<WORDSIZE> n2n_7_weight_28, bit<WORDSIZE> n2n_7_weight_29, bit<WORDSIZE> n2n_7_weight_30, bit<WORDSIZE> n2n_7_weight_31, bit<WORDSIZE> n2n_7_weight_32, bit<WORDSIZE> n2n_8_weight_1, bit<WORDSIZE> n2n_8_weight_2, bit<WORDSIZE> n2n_8_weight_3, bit<WORDSIZE> n2n_8_weight_4, bit<WORDSIZE> n2n_8_weight_5, bit<WORDSIZE> n2n_8_weight_6, bit<WORDSIZE> n2n_8_weight_7, bit<WORDSIZE> n2n_8_weight_8, bit<WORDSIZE> n2n_8_weight_9, bit<WORDSIZE> n2n_8_weight_10, bit<WORDSIZE> n2n_8_weight_11, bit<WORDSIZE> n2n_8_weight_12, bit<WORDSIZE> n2n_8_weight_13, bit<WORDSIZE> n2n_8_weight_14, bit<WORDSIZE> n2n_8_weight_15, bit<WORDSIZE> n2n_8_weight_16, bit<WORDSIZE> n2n_8_weight_17, bit<WORDSIZE> n2n_8_weight_18, bit<WORDSIZE> n2n_8_weight_19, bit<WORDSIZE> n2n_8_weight_20, bit<WORDSIZE> n2n_8_weight_21, bit<WORDSIZE> n2n_8_weight_22, bit<WORDSIZE> n2n_8_weight_23, bit<WORDSIZE> n2n_8_weight_24, bit<WORDSIZE> n2n_8_weight_25, bit<WORDSIZE> n2n_8_weight_26, bit<WORDSIZE> n2n_8_weight_27, bit<WORDSIZE> n2n_8_weight_28, bit<WORDSIZE> n2n_8_weight_29, bit<WORDSIZE> n2n_8_weight_30, bit<WORDSIZE> n2n_8_weight_31, bit<WORDSIZE> n2n_8_weight_32, bit<WORDSIZE> n2n_9_weight_1, bit<WORDSIZE> n2n_9_weight_2, bit<WORDSIZE> n2n_9_weight_3, bit<WORDSIZE> n2n_9_weight_4, bit<WORDSIZE> n2n_9_weight_5, bit<WORDSIZE> n2n_9_weight_6, bit<WORDSIZE> n2n_9_weight_7, bit<WORDSIZE> n2n_9_weight_8, bit<WORDSIZE> n2n_9_weight_9, bit<WORDSIZE> n2n_9_weight_10, bit<WORDSIZE> n2n_9_weight_11, bit<WORDSIZE> n2n_9_weight_12, bit<WORDSIZE> n2n_9_weight_13, bit<WORDSIZE> n2n_9_weight_14, bit<WORDSIZE> n2n_9_weight_15, bit<WORDSIZE> n2n_9_weight_16, bit<WORDSIZE> n2n_9_weight_17, bit<WORDSIZE> n2n_9_weight_18, bit<WORDSIZE> n2n_9_weight_19, bit<WORDSIZE> n2n_9_weight_20, bit<WORDSIZE> n2n_9_weight_21, bit<WORDSIZE> n2n_9_weight_22, bit<WORDSIZE> n2n_9_weight_23, bit<WORDSIZE> n2n_9_weight_24, bit<WORDSIZE> n2n_9_weight_25, bit<WORDSIZE> n2n_9_weight_26, bit<WORDSIZE> n2n_9_weight_27, bit<WORDSIZE> n2n_9_weight_28, bit<WORDSIZE> n2n_9_weight_29, bit<WORDSIZE> n2n_9_weight_30, bit<WORDSIZE> n2n_9_weight_31, bit<WORDSIZE> n2n_9_weight_32, bit<WORDSIZE> n2n_10_weight_1, bit<WORDSIZE> n2n_10_weight_2, bit<WORDSIZE> n2n_10_weight_3, bit<WORDSIZE> n2n_10_weight_4, bit<WORDSIZE> n2n_10_weight_5, bit<WORDSIZE> n2n_10_weight_6, bit<WORDSIZE> n2n_10_weight_7, bit<WORDSIZE> n2n_10_weight_8, bit<WORDSIZE> n2n_10_weight_9, bit<WORDSIZE> n2n_10_weight_10, bit<WORDSIZE> n2n_10_weight_11, bit<WORDSIZE> n2n_10_weight_12, bit<WORDSIZE> n2n_10_weight_13, bit<WORDSIZE> n2n_10_weight_14, bit<WORDSIZE> n2n_10_weight_15, bit<WORDSIZE> n2n_10_weight_16, bit<WORDSIZE> n2n_10_weight_17, bit<WORDSIZE> n2n_10_weight_18, bit<WORDSIZE> n2n_10_weight_19, bit<WORDSIZE> n2n_10_weight_20, bit<WORDSIZE> n2n_10_weight_21, bit<WORDSIZE> n2n_10_weight_22, bit<WORDSIZE> n2n_10_weight_23, bit<WORDSIZE> n2n_10_weight_24, bit<WORDSIZE> n2n_10_weight_25, bit<WORDSIZE> n2n_10_weight_26, bit<WORDSIZE> n2n_10_weight_27, bit<WORDSIZE> n2n_10_weight_28, bit<WORDSIZE> n2n_10_weight_29, bit<WORDSIZE> n2n_10_weight_30, bit<WORDSIZE> n2n_10_weight_31, bit<WORDSIZE> n2n_10_weight_32, bit<WORDSIZE> n2n_11_weight_1, bit<WORDSIZE> n2n_11_weight_2, bit<WORDSIZE> n2n_11_weight_3, bit<WORDSIZE> n2n_11_weight_4, bit<WORDSIZE> n2n_11_weight_5, bit<WORDSIZE> n2n_11_weight_6, bit<WORDSIZE> n2n_11_weight_7, bit<WORDSIZE> n2n_11_weight_8, bit<WORDSIZE> n2n_11_weight_9, bit<WORDSIZE> n2n_11_weight_10, bit<WORDSIZE> n2n_11_weight_11, bit<WORDSIZE> n2n_11_weight_12, bit<WORDSIZE> n2n_11_weight_13, bit<WORDSIZE> n2n_11_weight_14, bit<WORDSIZE> n2n_11_weight_15, bit<WORDSIZE> n2n_11_weight_16, bit<WORDSIZE> n2n_11_weight_17, bit<WORDSIZE> n2n_11_weight_18, bit<WORDSIZE> n2n_11_weight_19, bit<WORDSIZE> n2n_11_weight_20, bit<WORDSIZE> n2n_11_weight_21, bit<WORDSIZE> n2n_11_weight_22, bit<WORDSIZE> n2n_11_weight_23, bit<WORDSIZE> n2n_11_weight_24, bit<WORDSIZE> n2n_11_weight_25, bit<WORDSIZE> n2n_11_weight_26, bit<WORDSIZE> n2n_11_weight_27, bit<WORDSIZE> n2n_11_weight_28, bit<WORDSIZE> n2n_11_weight_29, bit<WORDSIZE> n2n_11_weight_30, bit<WORDSIZE> n2n_11_weight_31, bit<WORDSIZE> n2n_11_weight_32, bit<WORDSIZE> n2n_12_weight_1, bit<WORDSIZE> n2n_12_weight_2, bit<WORDSIZE> n2n_12_weight_3, bit<WORDSIZE> n2n_12_weight_4, bit<WORDSIZE> n2n_12_weight_5, bit<WORDSIZE> n2n_12_weight_6, bit<WORDSIZE> n2n_12_weight_7, bit<WORDSIZE> n2n_12_weight_8, bit<WORDSIZE> n2n_12_weight_9, bit<WORDSIZE> n2n_12_weight_10, bit<WORDSIZE> n2n_12_weight_11, bit<WORDSIZE> n2n_12_weight_12, bit<WORDSIZE> n2n_12_weight_13, bit<WORDSIZE> n2n_12_weight_14, bit<WORDSIZE> n2n_12_weight_15, bit<WORDSIZE> n2n_12_weight_16, bit<WORDSIZE> n2n_12_weight_17, bit<WORDSIZE> n2n_12_weight_18, bit<WORDSIZE> n2n_12_weight_19, bit<WORDSIZE> n2n_12_weight_20, bit<WORDSIZE> n2n_12_weight_21, bit<WORDSIZE> n2n_12_weight_22, bit<WORDSIZE> n2n_12_weight_23, bit<WORDSIZE> n2n_12_weight_24, bit<WORDSIZE> n2n_12_weight_25, bit<WORDSIZE> n2n_12_weight_26, bit<WORDSIZE> n2n_12_weight_27, bit<WORDSIZE> n2n_12_weight_28, bit<WORDSIZE> n2n_12_weight_29, bit<WORDSIZE> n2n_12_weight_30, bit<WORDSIZE> n2n_12_weight_31, bit<WORDSIZE> n2n_12_weight_32, bit<WORDSIZE> n2n_13_weight_1, bit<WORDSIZE> n2n_13_weight_2, bit<WORDSIZE> n2n_13_weight_3, bit<WORDSIZE> n2n_13_weight_4, bit<WORDSIZE> n2n_13_weight_5, bit<WORDSIZE> n2n_13_weight_6, bit<WORDSIZE> n2n_13_weight_7, bit<WORDSIZE> n2n_13_weight_8, bit<WORDSIZE> n2n_13_weight_9, bit<WORDSIZE> n2n_13_weight_10, bit<WORDSIZE> n2n_13_weight_11, bit<WORDSIZE> n2n_13_weight_12, bit<WORDSIZE> n2n_13_weight_13, bit<WORDSIZE> n2n_13_weight_14, bit<WORDSIZE> n2n_13_weight_15, bit<WORDSIZE> n2n_13_weight_16, bit<WORDSIZE> n2n_13_weight_17, bit<WORDSIZE> n2n_13_weight_18, bit<WORDSIZE> n2n_13_weight_19, bit<WORDSIZE> n2n_13_weight_20, bit<WORDSIZE> n2n_13_weight_21, bit<WORDSIZE> n2n_13_weight_22, bit<WORDSIZE> n2n_13_weight_23, bit<WORDSIZE> n2n_13_weight_24, bit<WORDSIZE> n2n_13_weight_25, bit<WORDSIZE> n2n_13_weight_26, bit<WORDSIZE> n2n_13_weight_27, bit<WORDSIZE> n2n_13_weight_28, bit<WORDSIZE> n2n_13_weight_29, bit<WORDSIZE> n2n_13_weight_30, bit<WORDSIZE> n2n_13_weight_31, bit<WORDSIZE> n2n_13_weight_32, bit<WORDSIZE> n2n_14_weight_1, bit<WORDSIZE> n2n_14_weight_2, bit<WORDSIZE> n2n_14_weight_3, bit<WORDSIZE> n2n_14_weight_4, bit<WORDSIZE> n2n_14_weight_5, bit<WORDSIZE> n2n_14_weight_6, bit<WORDSIZE> n2n_14_weight_7, bit<WORDSIZE> n2n_14_weight_8, bit<WORDSIZE> n2n_14_weight_9, bit<WORDSIZE> n2n_14_weight_10, bit<WORDSIZE> n2n_14_weight_11, bit<WORDSIZE> n2n_14_weight_12, bit<WORDSIZE> n2n_14_weight_13, bit<WORDSIZE> n2n_14_weight_14, bit<WORDSIZE> n2n_14_weight_15, bit<WORDSIZE> n2n_14_weight_16, bit<WORDSIZE> n2n_14_weight_17, bit<WORDSIZE> n2n_14_weight_18, bit<WORDSIZE> n2n_14_weight_19, bit<WORDSIZE> n2n_14_weight_20, bit<WORDSIZE> n2n_14_weight_21, bit<WORDSIZE> n2n_14_weight_22, bit<WORDSIZE> n2n_14_weight_23, bit<WORDSIZE> n2n_14_weight_24, bit<WORDSIZE> n2n_14_weight_25, bit<WORDSIZE> n2n_14_weight_26, bit<WORDSIZE> n2n_14_weight_27, bit<WORDSIZE> n2n_14_weight_28, bit<WORDSIZE> n2n_14_weight_29, bit<WORDSIZE> n2n_14_weight_30, bit<WORDSIZE> n2n_14_weight_31, bit<WORDSIZE> n2n_14_weight_32, bit<WORDSIZE> n2n_15_weight_1, bit<WORDSIZE> n2n_15_weight_2, bit<WORDSIZE> n2n_15_weight_3, bit<WORDSIZE> n2n_15_weight_4, bit<WORDSIZE> n2n_15_weight_5, bit<WORDSIZE> n2n_15_weight_6, bit<WORDSIZE> n2n_15_weight_7, bit<WORDSIZE> n2n_15_weight_8, bit<WORDSIZE> n2n_15_weight_9, bit<WORDSIZE> n2n_15_weight_10, bit<WORDSIZE> n2n_15_weight_11, bit<WORDSIZE> n2n_15_weight_12, bit<WORDSIZE> n2n_15_weight_13, bit<WORDSIZE> n2n_15_weight_14, bit<WORDSIZE> n2n_15_weight_15, bit<WORDSIZE> n2n_15_weight_16, bit<WORDSIZE> n2n_15_weight_17, bit<WORDSIZE> n2n_15_weight_18, bit<WORDSIZE> n2n_15_weight_19, bit<WORDSIZE> n2n_15_weight_20, bit<WORDSIZE> n2n_15_weight_21, bit<WORDSIZE> n2n_15_weight_22, bit<WORDSIZE> n2n_15_weight_23, bit<WORDSIZE> n2n_15_weight_24, bit<WORDSIZE> n2n_15_weight_25, bit<WORDSIZE> n2n_15_weight_26, bit<WORDSIZE> n2n_15_weight_27, bit<WORDSIZE> n2n_15_weight_28, bit<WORDSIZE> n2n_15_weight_29, bit<WORDSIZE> n2n_15_weight_30, bit<WORDSIZE> n2n_15_weight_31, bit<WORDSIZE> n2n_15_weight_32, bit<WORDSIZE> n2n_16_weight_1, bit<WORDSIZE> n2n_16_weight_2, bit<WORDSIZE> n2n_16_weight_3, bit<WORDSIZE> n2n_16_weight_4, bit<WORDSIZE> n2n_16_weight_5, bit<WORDSIZE> n2n_16_weight_6, bit<WORDSIZE> n2n_16_weight_7, bit<WORDSIZE> n2n_16_weight_8, bit<WORDSIZE> n2n_16_weight_9, bit<WORDSIZE> n2n_16_weight_10, bit<WORDSIZE> n2n_16_weight_11, bit<WORDSIZE> n2n_16_weight_12, bit<WORDSIZE> n2n_16_weight_13, bit<WORDSIZE> n2n_16_weight_14, bit<WORDSIZE> n2n_16_weight_15, bit<WORDSIZE> n2n_16_weight_16, bit<WORDSIZE> n2n_16_weight_17, bit<WORDSIZE> n2n_16_weight_18, bit<WORDSIZE> n2n_16_weight_19, bit<WORDSIZE> n2n_16_weight_20, bit<WORDSIZE> n2n_16_weight_21, bit<WORDSIZE> n2n_16_weight_22, bit<WORDSIZE> n2n_16_weight_23, bit<WORDSIZE> n2n_16_weight_24, bit<WORDSIZE> n2n_16_weight_25, bit<WORDSIZE> n2n_16_weight_26, bit<WORDSIZE> n2n_16_weight_27, bit<WORDSIZE> n2n_16_weight_28, bit<WORDSIZE> n2n_16_weight_29, bit<WORDSIZE> n2n_16_weight_30, bit<WORDSIZE> n2n_16_weight_31, bit<WORDSIZE> n2n_16_weight_32, bit<WORDSIZE> n2n_17_weight_1, bit<WORDSIZE> n2n_17_weight_2, bit<WORDSIZE> n2n_17_weight_3, bit<WORDSIZE> n2n_17_weight_4, bit<WORDSIZE> n2n_17_weight_5, bit<WORDSIZE> n2n_17_weight_6, bit<WORDSIZE> n2n_17_weight_7, bit<WORDSIZE> n2n_17_weight_8, bit<WORDSIZE> n2n_17_weight_9, bit<WORDSIZE> n2n_17_weight_10, bit<WORDSIZE> n2n_17_weight_11, bit<WORDSIZE> n2n_17_weight_12, bit<WORDSIZE> n2n_17_weight_13, bit<WORDSIZE> n2n_17_weight_14, bit<WORDSIZE> n2n_17_weight_15, bit<WORDSIZE> n2n_17_weight_16, bit<WORDSIZE> n2n_17_weight_17, bit<WORDSIZE> n2n_17_weight_18, bit<WORDSIZE> n2n_17_weight_19, bit<WORDSIZE> n2n_17_weight_20, bit<WORDSIZE> n2n_17_weight_21, bit<WORDSIZE> n2n_17_weight_22, bit<WORDSIZE> n2n_17_weight_23, bit<WORDSIZE> n2n_17_weight_24, bit<WORDSIZE> n2n_17_weight_25, bit<WORDSIZE> n2n_17_weight_26, bit<WORDSIZE> n2n_17_weight_27, bit<WORDSIZE> n2n_17_weight_28, bit<WORDSIZE> n2n_17_weight_29, bit<WORDSIZE> n2n_17_weight_30, bit<WORDSIZE> n2n_17_weight_31, bit<WORDSIZE> n2n_17_weight_32, bit<WORDSIZE> n2n_18_weight_1, bit<WORDSIZE> n2n_18_weight_2, bit<WORDSIZE> n2n_18_weight_3, bit<WORDSIZE> n2n_18_weight_4, bit<WORDSIZE> n2n_18_weight_5, bit<WORDSIZE> n2n_18_weight_6, bit<WORDSIZE> n2n_18_weight_7, bit<WORDSIZE> n2n_18_weight_8, bit<WORDSIZE> n2n_18_weight_9, bit<WORDSIZE> n2n_18_weight_10, bit<WORDSIZE> n2n_18_weight_11, bit<WORDSIZE> n2n_18_weight_12, bit<WORDSIZE> n2n_18_weight_13, bit<WORDSIZE> n2n_18_weight_14, bit<WORDSIZE> n2n_18_weight_15, bit<WORDSIZE> n2n_18_weight_16, bit<WORDSIZE> n2n_18_weight_17, bit<WORDSIZE> n2n_18_weight_18, bit<WORDSIZE> n2n_18_weight_19, bit<WORDSIZE> n2n_18_weight_20, bit<WORDSIZE> n2n_18_weight_21, bit<WORDSIZE> n2n_18_weight_22, bit<WORDSIZE> n2n_18_weight_23, bit<WORDSIZE> n2n_18_weight_24, bit<WORDSIZE> n2n_18_weight_25, bit<WORDSIZE> n2n_18_weight_26, bit<WORDSIZE> n2n_18_weight_27, bit<WORDSIZE> n2n_18_weight_28, bit<WORDSIZE> n2n_18_weight_29, bit<WORDSIZE> n2n_18_weight_30, bit<WORDSIZE> n2n_18_weight_31, bit<WORDSIZE> n2n_18_weight_32, bit<WORDSIZE> n2n_19_weight_1, bit<WORDSIZE> n2n_19_weight_2, bit<WORDSIZE> n2n_19_weight_3, bit<WORDSIZE> n2n_19_weight_4, bit<WORDSIZE> n2n_19_weight_5, bit<WORDSIZE> n2n_19_weight_6, bit<WORDSIZE> n2n_19_weight_7, bit<WORDSIZE> n2n_19_weight_8, bit<WORDSIZE> n2n_19_weight_9, bit<WORDSIZE> n2n_19_weight_10, bit<WORDSIZE> n2n_19_weight_11, bit<WORDSIZE> n2n_19_weight_12, bit<WORDSIZE> n2n_19_weight_13, bit<WORDSIZE> n2n_19_weight_14, bit<WORDSIZE> n2n_19_weight_15, bit<WORDSIZE> n2n_19_weight_16, bit<WORDSIZE> n2n_19_weight_17, bit<WORDSIZE> n2n_19_weight_18, bit<WORDSIZE> n2n_19_weight_19, bit<WORDSIZE> n2n_19_weight_20, bit<WORDSIZE> n2n_19_weight_21, bit<WORDSIZE> n2n_19_weight_22, bit<WORDSIZE> n2n_19_weight_23, bit<WORDSIZE> n2n_19_weight_24, bit<WORDSIZE> n2n_19_weight_25, bit<WORDSIZE> n2n_19_weight_26, bit<WORDSIZE> n2n_19_weight_27, bit<WORDSIZE> n2n_19_weight_28, bit<WORDSIZE> n2n_19_weight_29, bit<WORDSIZE> n2n_19_weight_30, bit<WORDSIZE> n2n_19_weight_31, bit<WORDSIZE> n2n_19_weight_32, bit<WORDSIZE> n2n_20_weight_1, bit<WORDSIZE> n2n_20_weight_2, bit<WORDSIZE> n2n_20_weight_3, bit<WORDSIZE> n2n_20_weight_4, bit<WORDSIZE> n2n_20_weight_5, bit<WORDSIZE> n2n_20_weight_6, bit<WORDSIZE> n2n_20_weight_7, bit<WORDSIZE> n2n_20_weight_8, bit<WORDSIZE> n2n_20_weight_9, bit<WORDSIZE> n2n_20_weight_10, bit<WORDSIZE> n2n_20_weight_11, bit<WORDSIZE> n2n_20_weight_12, bit<WORDSIZE> n2n_20_weight_13, bit<WORDSIZE> n2n_20_weight_14, bit<WORDSIZE> n2n_20_weight_15, bit<WORDSIZE> n2n_20_weight_16, bit<WORDSIZE> n2n_20_weight_17, bit<WORDSIZE> n2n_20_weight_18, bit<WORDSIZE> n2n_20_weight_19, bit<WORDSIZE> n2n_20_weight_20, bit<WORDSIZE> n2n_20_weight_21, bit<WORDSIZE> n2n_20_weight_22, bit<WORDSIZE> n2n_20_weight_23, bit<WORDSIZE> n2n_20_weight_24, bit<WORDSIZE> n2n_20_weight_25, bit<WORDSIZE> n2n_20_weight_26, bit<WORDSIZE> n2n_20_weight_27, bit<WORDSIZE> n2n_20_weight_28, bit<WORDSIZE> n2n_20_weight_29, bit<WORDSIZE> n2n_20_weight_30, bit<WORDSIZE> n2n_20_weight_31, bit<WORDSIZE> n2n_20_weight_32, bit<WORDSIZE> n2n_21_weight_1, bit<WORDSIZE> n2n_21_weight_2, bit<WORDSIZE> n2n_21_weight_3, bit<WORDSIZE> n2n_21_weight_4, bit<WORDSIZE> n2n_21_weight_5, bit<WORDSIZE> n2n_21_weight_6, bit<WORDSIZE> n2n_21_weight_7, bit<WORDSIZE> n2n_21_weight_8, bit<WORDSIZE> n2n_21_weight_9, bit<WORDSIZE> n2n_21_weight_10, bit<WORDSIZE> n2n_21_weight_11, bit<WORDSIZE> n2n_21_weight_12, bit<WORDSIZE> n2n_21_weight_13, bit<WORDSIZE> n2n_21_weight_14, bit<WORDSIZE> n2n_21_weight_15, bit<WORDSIZE> n2n_21_weight_16, bit<WORDSIZE> n2n_21_weight_17, bit<WORDSIZE> n2n_21_weight_18, bit<WORDSIZE> n2n_21_weight_19, bit<WORDSIZE> n2n_21_weight_20, bit<WORDSIZE> n2n_21_weight_21, bit<WORDSIZE> n2n_21_weight_22, bit<WORDSIZE> n2n_21_weight_23, bit<WORDSIZE> n2n_21_weight_24, bit<WORDSIZE> n2n_21_weight_25, bit<WORDSIZE> n2n_21_weight_26, bit<WORDSIZE> n2n_21_weight_27, bit<WORDSIZE> n2n_21_weight_28, bit<WORDSIZE> n2n_21_weight_29, bit<WORDSIZE> n2n_21_weight_30, bit<WORDSIZE> n2n_21_weight_31, bit<WORDSIZE> n2n_21_weight_32, bit<WORDSIZE> n2n_22_weight_1, bit<WORDSIZE> n2n_22_weight_2, bit<WORDSIZE> n2n_22_weight_3, bit<WORDSIZE> n2n_22_weight_4, bit<WORDSIZE> n2n_22_weight_5, bit<WORDSIZE> n2n_22_weight_6, bit<WORDSIZE> n2n_22_weight_7, bit<WORDSIZE> n2n_22_weight_8, bit<WORDSIZE> n2n_22_weight_9, bit<WORDSIZE> n2n_22_weight_10, bit<WORDSIZE> n2n_22_weight_11, bit<WORDSIZE> n2n_22_weight_12, bit<WORDSIZE> n2n_22_weight_13, bit<WORDSIZE> n2n_22_weight_14, bit<WORDSIZE> n2n_22_weight_15, bit<WORDSIZE> n2n_22_weight_16, bit<WORDSIZE> n2n_22_weight_17, bit<WORDSIZE> n2n_22_weight_18, bit<WORDSIZE> n2n_22_weight_19, bit<WORDSIZE> n2n_22_weight_20, bit<WORDSIZE> n2n_22_weight_21, bit<WORDSIZE> n2n_22_weight_22, bit<WORDSIZE> n2n_22_weight_23, bit<WORDSIZE> n2n_22_weight_24, bit<WORDSIZE> n2n_22_weight_25, bit<WORDSIZE> n2n_22_weight_26, bit<WORDSIZE> n2n_22_weight_27, bit<WORDSIZE> n2n_22_weight_28, bit<WORDSIZE> n2n_22_weight_29, bit<WORDSIZE> n2n_22_weight_30, bit<WORDSIZE> n2n_22_weight_31, bit<WORDSIZE> n2n_22_weight_32, bit<WORDSIZE> n2n_23_weight_1, bit<WORDSIZE> n2n_23_weight_2, bit<WORDSIZE> n2n_23_weight_3, bit<WORDSIZE> n2n_23_weight_4, bit<WORDSIZE> n2n_23_weight_5, bit<WORDSIZE> n2n_23_weight_6, bit<WORDSIZE> n2n_23_weight_7, bit<WORDSIZE> n2n_23_weight_8, bit<WORDSIZE> n2n_23_weight_9, bit<WORDSIZE> n2n_23_weight_10, bit<WORDSIZE> n2n_23_weight_11, bit<WORDSIZE> n2n_23_weight_12, bit<WORDSIZE> n2n_23_weight_13, bit<WORDSIZE> n2n_23_weight_14, bit<WORDSIZE> n2n_23_weight_15, bit<WORDSIZE> n2n_23_weight_16, bit<WORDSIZE> n2n_23_weight_17, bit<WORDSIZE> n2n_23_weight_18, bit<WORDSIZE> n2n_23_weight_19, bit<WORDSIZE> n2n_23_weight_20, bit<WORDSIZE> n2n_23_weight_21, bit<WORDSIZE> n2n_23_weight_22, bit<WORDSIZE> n2n_23_weight_23, bit<WORDSIZE> n2n_23_weight_24, bit<WORDSIZE> n2n_23_weight_25, bit<WORDSIZE> n2n_23_weight_26, bit<WORDSIZE> n2n_23_weight_27, bit<WORDSIZE> n2n_23_weight_28, bit<WORDSIZE> n2n_23_weight_29, bit<WORDSIZE> n2n_23_weight_30, bit<WORDSIZE> n2n_23_weight_31, bit<WORDSIZE> n2n_23_weight_32, bit<WORDSIZE> n2n_24_weight_1, bit<WORDSIZE> n2n_24_weight_2, bit<WORDSIZE> n2n_24_weight_3, bit<WORDSIZE> n2n_24_weight_4, bit<WORDSIZE> n2n_24_weight_5, bit<WORDSIZE> n2n_24_weight_6, bit<WORDSIZE> n2n_24_weight_7, bit<WORDSIZE> n2n_24_weight_8, bit<WORDSIZE> n2n_24_weight_9, bit<WORDSIZE> n2n_24_weight_10, bit<WORDSIZE> n2n_24_weight_11, bit<WORDSIZE> n2n_24_weight_12, bit<WORDSIZE> n2n_24_weight_13, bit<WORDSIZE> n2n_24_weight_14, bit<WORDSIZE> n2n_24_weight_15, bit<WORDSIZE> n2n_24_weight_16, bit<WORDSIZE> n2n_24_weight_17, bit<WORDSIZE> n2n_24_weight_18, bit<WORDSIZE> n2n_24_weight_19, bit<WORDSIZE> n2n_24_weight_20, bit<WORDSIZE> n2n_24_weight_21, bit<WORDSIZE> n2n_24_weight_22, bit<WORDSIZE> n2n_24_weight_23, bit<WORDSIZE> n2n_24_weight_24, bit<WORDSIZE> n2n_24_weight_25, bit<WORDSIZE> n2n_24_weight_26, bit<WORDSIZE> n2n_24_weight_27, bit<WORDSIZE> n2n_24_weight_28, bit<WORDSIZE> n2n_24_weight_29, bit<WORDSIZE> n2n_24_weight_30, bit<WORDSIZE> n2n_24_weight_31, bit<WORDSIZE> n2n_24_weight_32, bit<WORDSIZE> n2n_25_weight_1, bit<WORDSIZE> n2n_25_weight_2, bit<WORDSIZE> n2n_25_weight_3, bit<WORDSIZE> n2n_25_weight_4, bit<WORDSIZE> n2n_25_weight_5, bit<WORDSIZE> n2n_25_weight_6, bit<WORDSIZE> n2n_25_weight_7, bit<WORDSIZE> n2n_25_weight_8, bit<WORDSIZE> n2n_25_weight_9, bit<WORDSIZE> n2n_25_weight_10, bit<WORDSIZE> n2n_25_weight_11, bit<WORDSIZE> n2n_25_weight_12, bit<WORDSIZE> n2n_25_weight_13, bit<WORDSIZE> n2n_25_weight_14, bit<WORDSIZE> n2n_25_weight_15, bit<WORDSIZE> n2n_25_weight_16, bit<WORDSIZE> n2n_25_weight_17, bit<WORDSIZE> n2n_25_weight_18, bit<WORDSIZE> n2n_25_weight_19, bit<WORDSIZE> n2n_25_weight_20, bit<WORDSIZE> n2n_25_weight_21, bit<WORDSIZE> n2n_25_weight_22, bit<WORDSIZE> n2n_25_weight_23, bit<WORDSIZE> n2n_25_weight_24, bit<WORDSIZE> n2n_25_weight_25, bit<WORDSIZE> n2n_25_weight_26, bit<WORDSIZE> n2n_25_weight_27, bit<WORDSIZE> n2n_25_weight_28, bit<WORDSIZE> n2n_25_weight_29, bit<WORDSIZE> n2n_25_weight_30, bit<WORDSIZE> n2n_25_weight_31, bit<WORDSIZE> n2n_25_weight_32, bit<WORDSIZE> n2n_26_weight_1, bit<WORDSIZE> n2n_26_weight_2, bit<WORDSIZE> n2n_26_weight_3, bit<WORDSIZE> n2n_26_weight_4, bit<WORDSIZE> n2n_26_weight_5, bit<WORDSIZE> n2n_26_weight_6, bit<WORDSIZE> n2n_26_weight_7, bit<WORDSIZE> n2n_26_weight_8, bit<WORDSIZE> n2n_26_weight_9, bit<WORDSIZE> n2n_26_weight_10, bit<WORDSIZE> n2n_26_weight_11, bit<WORDSIZE> n2n_26_weight_12, bit<WORDSIZE> n2n_26_weight_13, bit<WORDSIZE> n2n_26_weight_14, bit<WORDSIZE> n2n_26_weight_15, bit<WORDSIZE> n2n_26_weight_16, bit<WORDSIZE> n2n_26_weight_17, bit<WORDSIZE> n2n_26_weight_18, bit<WORDSIZE> n2n_26_weight_19, bit<WORDSIZE> n2n_26_weight_20, bit<WORDSIZE> n2n_26_weight_21, bit<WORDSIZE> n2n_26_weight_22, bit<WORDSIZE> n2n_26_weight_23, bit<WORDSIZE> n2n_26_weight_24, bit<WORDSIZE> n2n_26_weight_25, bit<WORDSIZE> n2n_26_weight_26, bit<WORDSIZE> n2n_26_weight_27, bit<WORDSIZE> n2n_26_weight_28, bit<WORDSIZE> n2n_26_weight_29, bit<WORDSIZE> n2n_26_weight_30, bit<WORDSIZE> n2n_26_weight_31, bit<WORDSIZE> n2n_26_weight_32, bit<WORDSIZE> n2n_27_weight_1, bit<WORDSIZE> n2n_27_weight_2, bit<WORDSIZE> n2n_27_weight_3, bit<WORDSIZE> n2n_27_weight_4, bit<WORDSIZE> n2n_27_weight_5, bit<WORDSIZE> n2n_27_weight_6, bit<WORDSIZE> n2n_27_weight_7, bit<WORDSIZE> n2n_27_weight_8, bit<WORDSIZE> n2n_27_weight_9, bit<WORDSIZE> n2n_27_weight_10, bit<WORDSIZE> n2n_27_weight_11, bit<WORDSIZE> n2n_27_weight_12, bit<WORDSIZE> n2n_27_weight_13, bit<WORDSIZE> n2n_27_weight_14, bit<WORDSIZE> n2n_27_weight_15, bit<WORDSIZE> n2n_27_weight_16, bit<WORDSIZE> n2n_27_weight_17, bit<WORDSIZE> n2n_27_weight_18, bit<WORDSIZE> n2n_27_weight_19, bit<WORDSIZE> n2n_27_weight_20, bit<WORDSIZE> n2n_27_weight_21, bit<WORDSIZE> n2n_27_weight_22, bit<WORDSIZE> n2n_27_weight_23, bit<WORDSIZE> n2n_27_weight_24, bit<WORDSIZE> n2n_27_weight_25, bit<WORDSIZE> n2n_27_weight_26, bit<WORDSIZE> n2n_27_weight_27, bit<WORDSIZE> n2n_27_weight_28, bit<WORDSIZE> n2n_27_weight_29, bit<WORDSIZE> n2n_27_weight_30, bit<WORDSIZE> n2n_27_weight_31, bit<WORDSIZE> n2n_27_weight_32, bit<WORDSIZE> n2n_28_weight_1, bit<WORDSIZE> n2n_28_weight_2, bit<WORDSIZE> n2n_28_weight_3, bit<WORDSIZE> n2n_28_weight_4, bit<WORDSIZE> n2n_28_weight_5, bit<WORDSIZE> n2n_28_weight_6, bit<WORDSIZE> n2n_28_weight_7, bit<WORDSIZE> n2n_28_weight_8, bit<WORDSIZE> n2n_28_weight_9, bit<WORDSIZE> n2n_28_weight_10, bit<WORDSIZE> n2n_28_weight_11, bit<WORDSIZE> n2n_28_weight_12, bit<WORDSIZE> n2n_28_weight_13, bit<WORDSIZE> n2n_28_weight_14, bit<WORDSIZE> n2n_28_weight_15, bit<WORDSIZE> n2n_28_weight_16, bit<WORDSIZE> n2n_28_weight_17, bit<WORDSIZE> n2n_28_weight_18, bit<WORDSIZE> n2n_28_weight_19, bit<WORDSIZE> n2n_28_weight_20, bit<WORDSIZE> n2n_28_weight_21, bit<WORDSIZE> n2n_28_weight_22, bit<WORDSIZE> n2n_28_weight_23, bit<WORDSIZE> n2n_28_weight_24, bit<WORDSIZE> n2n_28_weight_25, bit<WORDSIZE> n2n_28_weight_26, bit<WORDSIZE> n2n_28_weight_27, bit<WORDSIZE> n2n_28_weight_28, bit<WORDSIZE> n2n_28_weight_29, bit<WORDSIZE> n2n_28_weight_30, bit<WORDSIZE> n2n_28_weight_31, bit<WORDSIZE> n2n_28_weight_32, bit<WORDSIZE> n2n_29_weight_1, bit<WORDSIZE> n2n_29_weight_2, bit<WORDSIZE> n2n_29_weight_3, bit<WORDSIZE> n2n_29_weight_4, bit<WORDSIZE> n2n_29_weight_5, bit<WORDSIZE> n2n_29_weight_6, bit<WORDSIZE> n2n_29_weight_7, bit<WORDSIZE> n2n_29_weight_8, bit<WORDSIZE> n2n_29_weight_9, bit<WORDSIZE> n2n_29_weight_10, bit<WORDSIZE> n2n_29_weight_11, bit<WORDSIZE> n2n_29_weight_12, bit<WORDSIZE> n2n_29_weight_13, bit<WORDSIZE> n2n_29_weight_14, bit<WORDSIZE> n2n_29_weight_15, bit<WORDSIZE> n2n_29_weight_16, bit<WORDSIZE> n2n_29_weight_17, bit<WORDSIZE> n2n_29_weight_18, bit<WORDSIZE> n2n_29_weight_19, bit<WORDSIZE> n2n_29_weight_20, bit<WORDSIZE> n2n_29_weight_21, bit<WORDSIZE> n2n_29_weight_22, bit<WORDSIZE> n2n_29_weight_23, bit<WORDSIZE> n2n_29_weight_24, bit<WORDSIZE> n2n_29_weight_25, bit<WORDSIZE> n2n_29_weight_26, bit<WORDSIZE> n2n_29_weight_27, bit<WORDSIZE> n2n_29_weight_28, bit<WORDSIZE> n2n_29_weight_29, bit<WORDSIZE> n2n_29_weight_30, bit<WORDSIZE> n2n_29_weight_31, bit<WORDSIZE> n2n_29_weight_32, bit<WORDSIZE> n2n_30_weight_1, bit<WORDSIZE> n2n_30_weight_2, bit<WORDSIZE> n2n_30_weight_3, bit<WORDSIZE> n2n_30_weight_4, bit<WORDSIZE> n2n_30_weight_5, bit<WORDSIZE> n2n_30_weight_6, bit<WORDSIZE> n2n_30_weight_7, bit<WORDSIZE> n2n_30_weight_8, bit<WORDSIZE> n2n_30_weight_9, bit<WORDSIZE> n2n_30_weight_10, bit<WORDSIZE> n2n_30_weight_11, bit<WORDSIZE> n2n_30_weight_12, bit<WORDSIZE> n2n_30_weight_13, bit<WORDSIZE> n2n_30_weight_14, bit<WORDSIZE> n2n_30_weight_15, bit<WORDSIZE> n2n_30_weight_16, bit<WORDSIZE> n2n_30_weight_17, bit<WORDSIZE> n2n_30_weight_18, bit<WORDSIZE> n2n_30_weight_19, bit<WORDSIZE> n2n_30_weight_20, bit<WORDSIZE> n2n_30_weight_21, bit<WORDSIZE> n2n_30_weight_22, bit<WORDSIZE> n2n_30_weight_23, bit<WORDSIZE> n2n_30_weight_24, bit<WORDSIZE> n2n_30_weight_25, bit<WORDSIZE> n2n_30_weight_26, bit<WORDSIZE> n2n_30_weight_27, bit<WORDSIZE> n2n_30_weight_28, bit<WORDSIZE> n2n_30_weight_29, bit<WORDSIZE> n2n_30_weight_30, bit<WORDSIZE> n2n_30_weight_31, bit<WORDSIZE> n2n_30_weight_32, bit<WORDSIZE> n2n_31_weight_1, bit<WORDSIZE> n2n_31_weight_2, bit<WORDSIZE> n2n_31_weight_3, bit<WORDSIZE> n2n_31_weight_4, bit<WORDSIZE> n2n_31_weight_5, bit<WORDSIZE> n2n_31_weight_6, bit<WORDSIZE> n2n_31_weight_7, bit<WORDSIZE> n2n_31_weight_8, bit<WORDSIZE> n2n_31_weight_9, bit<WORDSIZE> n2n_31_weight_10, bit<WORDSIZE> n2n_31_weight_11, bit<WORDSIZE> n2n_31_weight_12, bit<WORDSIZE> n2n_31_weight_13, bit<WORDSIZE> n2n_31_weight_14, bit<WORDSIZE> n2n_31_weight_15, bit<WORDSIZE> n2n_31_weight_16, bit<WORDSIZE> n2n_31_weight_17, bit<WORDSIZE> n2n_31_weight_18, bit<WORDSIZE> n2n_31_weight_19, bit<WORDSIZE> n2n_31_weight_20, bit<WORDSIZE> n2n_31_weight_21, bit<WORDSIZE> n2n_31_weight_22, bit<WORDSIZE> n2n_31_weight_23, bit<WORDSIZE> n2n_31_weight_24, bit<WORDSIZE> n2n_31_weight_25, bit<WORDSIZE> n2n_31_weight_26, bit<WORDSIZE> n2n_31_weight_27, bit<WORDSIZE> n2n_31_weight_28, bit<WORDSIZE> n2n_31_weight_29, bit<WORDSIZE> n2n_31_weight_30, bit<WORDSIZE> n2n_31_weight_31, bit<WORDSIZE> n2n_31_weight_32, bit<WORDSIZE> n2n_32_weight_1, bit<WORDSIZE> n2n_32_weight_2, bit<WORDSIZE> n2n_32_weight_3, bit<WORDSIZE> n2n_32_weight_4, bit<WORDSIZE> n2n_32_weight_5, bit<WORDSIZE> n2n_32_weight_6, bit<WORDSIZE> n2n_32_weight_7, bit<WORDSIZE> n2n_32_weight_8, bit<WORDSIZE> n2n_32_weight_9, bit<WORDSIZE> n2n_32_weight_10, bit<WORDSIZE> n2n_32_weight_11, bit<WORDSIZE> n2n_32_weight_12, bit<WORDSIZE> n2n_32_weight_13, bit<WORDSIZE> n2n_32_weight_14, bit<WORDSIZE> n2n_32_weight_15, bit<WORDSIZE> n2n_32_weight_16, bit<WORDSIZE> n2n_32_weight_17, bit<WORDSIZE> n2n_32_weight_18, bit<WORDSIZE> n2n_32_weight_19, bit<WORDSIZE> n2n_32_weight_20, bit<WORDSIZE> n2n_32_weight_21, bit<WORDSIZE> n2n_32_weight_22, bit<WORDSIZE> n2n_32_weight_23, bit<WORDSIZE> n2n_32_weight_24, bit<WORDSIZE> n2n_32_weight_25, bit<WORDSIZE> n2n_32_weight_26, bit<WORDSIZE> n2n_32_weight_27, bit<WORDSIZE> n2n_32_weight_28, bit<WORDSIZE> n2n_32_weight_29, bit<WORDSIZE> n2n_32_weight_30, bit<WORDSIZE> n2n_32_weight_31, bit<WORDSIZE> n2n_32_weight_32){
   meta.n2n_1_weight_1 = n2n_1_weight_1;
   meta.n2n_1_weight_2 = n2n_1_weight_2;
   meta.n2n_1_weight_3 = n2n_1_weight_3;
   meta.n2n_1_weight_4 = n2n_1_weight_4;
   meta.n2n_1_weight_5 = n2n_1_weight_5;
   meta.n2n_1_weight_6 = n2n_1_weight_6;
   meta.n2n_1_weight_7 = n2n_1_weight_7;
   meta.n2n_1_weight_8 = n2n_1_weight_8;
   meta.n2n_1_weight_9 = n2n_1_weight_9;
   meta.n2n_1_weight_10 = n2n_1_weight_10;
   meta.n2n_1_weight_11 = n2n_1_weight_11;
   meta.n2n_1_weight_12 = n2n_1_weight_12;
   meta.n2n_1_weight_13 = n2n_1_weight_13;
   meta.n2n_1_weight_14 = n2n_1_weight_14;
   meta.n2n_1_weight_15 = n2n_1_weight_15;
   meta.n2n_1_weight_16 = n2n_1_weight_16;
   meta.n2n_1_weight_17 = n2n_1_weight_17;
   meta.n2n_1_weight_18 = n2n_1_weight_18;
   meta.n2n_1_weight_19 = n2n_1_weight_19;
   meta.n2n_1_weight_20 = n2n_1_weight_20;
   meta.n2n_1_weight_21 = n2n_1_weight_21;
   meta.n2n_1_weight_22 = n2n_1_weight_22;
   meta.n2n_1_weight_23 = n2n_1_weight_23;
   meta.n2n_1_weight_24 = n2n_1_weight_24;
   meta.n2n_1_weight_25 = n2n_1_weight_25;
   meta.n2n_1_weight_26 = n2n_1_weight_26;
   meta.n2n_1_weight_27 = n2n_1_weight_27;
   meta.n2n_1_weight_28 = n2n_1_weight_28;
   meta.n2n_1_weight_29 = n2n_1_weight_29;
   meta.n2n_1_weight_30 = n2n_1_weight_30;
   meta.n2n_1_weight_31 = n2n_1_weight_31;
   meta.n2n_1_weight_32 = n2n_1_weight_32;
   meta.n2n_2_weight_1 = n2n_2_weight_1;
   meta.n2n_2_weight_2 = n2n_2_weight_2;
   meta.n2n_2_weight_3 = n2n_2_weight_3;
   meta.n2n_2_weight_4 = n2n_2_weight_4;
   meta.n2n_2_weight_5 = n2n_2_weight_5;
   meta.n2n_2_weight_6 = n2n_2_weight_6;
   meta.n2n_2_weight_7 = n2n_2_weight_7;
   meta.n2n_2_weight_8 = n2n_2_weight_8;
   meta.n2n_2_weight_9 = n2n_2_weight_9;
   meta.n2n_2_weight_10 = n2n_2_weight_10;
   meta.n2n_2_weight_11 = n2n_2_weight_11;
   meta.n2n_2_weight_12 = n2n_2_weight_12;
   meta.n2n_2_weight_13 = n2n_2_weight_13;
   meta.n2n_2_weight_14 = n2n_2_weight_14;
   meta.n2n_2_weight_15 = n2n_2_weight_15;
   meta.n2n_2_weight_16 = n2n_2_weight_16;
   meta.n2n_2_weight_17 = n2n_2_weight_17;
   meta.n2n_2_weight_18 = n2n_2_weight_18;
   meta.n2n_2_weight_19 = n2n_2_weight_19;
   meta.n2n_2_weight_20 = n2n_2_weight_20;
   meta.n2n_2_weight_21 = n2n_2_weight_21;
   meta.n2n_2_weight_22 = n2n_2_weight_22;
   meta.n2n_2_weight_23 = n2n_2_weight_23;
   meta.n2n_2_weight_24 = n2n_2_weight_24;
   meta.n2n_2_weight_25 = n2n_2_weight_25;
   meta.n2n_2_weight_26 = n2n_2_weight_26;
   meta.n2n_2_weight_27 = n2n_2_weight_27;
   meta.n2n_2_weight_28 = n2n_2_weight_28;
   meta.n2n_2_weight_29 = n2n_2_weight_29;
   meta.n2n_2_weight_30 = n2n_2_weight_30;
   meta.n2n_2_weight_31 = n2n_2_weight_31;
   meta.n2n_2_weight_32 = n2n_2_weight_32;
   meta.n2n_3_weight_1 = n2n_3_weight_1;
   meta.n2n_3_weight_2 = n2n_3_weight_2;
   meta.n2n_3_weight_3 = n2n_3_weight_3;
   meta.n2n_3_weight_4 = n2n_3_weight_4;
   meta.n2n_3_weight_5 = n2n_3_weight_5;
   meta.n2n_3_weight_6 = n2n_3_weight_6;
   meta.n2n_3_weight_7 = n2n_3_weight_7;
   meta.n2n_3_weight_8 = n2n_3_weight_8;
   meta.n2n_3_weight_9 = n2n_3_weight_9;
   meta.n2n_3_weight_10 = n2n_3_weight_10;
   meta.n2n_3_weight_11 = n2n_3_weight_11;
   meta.n2n_3_weight_12 = n2n_3_weight_12;
   meta.n2n_3_weight_13 = n2n_3_weight_13;
   meta.n2n_3_weight_14 = n2n_3_weight_14;
   meta.n2n_3_weight_15 = n2n_3_weight_15;
   meta.n2n_3_weight_16 = n2n_3_weight_16;
   meta.n2n_3_weight_17 = n2n_3_weight_17;
   meta.n2n_3_weight_18 = n2n_3_weight_18;
   meta.n2n_3_weight_19 = n2n_3_weight_19;
   meta.n2n_3_weight_20 = n2n_3_weight_20;
   meta.n2n_3_weight_21 = n2n_3_weight_21;
   meta.n2n_3_weight_22 = n2n_3_weight_22;
   meta.n2n_3_weight_23 = n2n_3_weight_23;
   meta.n2n_3_weight_24 = n2n_3_weight_24;
   meta.n2n_3_weight_25 = n2n_3_weight_25;
   meta.n2n_3_weight_26 = n2n_3_weight_26;
   meta.n2n_3_weight_27 = n2n_3_weight_27;
   meta.n2n_3_weight_28 = n2n_3_weight_28;
   meta.n2n_3_weight_29 = n2n_3_weight_29;
   meta.n2n_3_weight_30 = n2n_3_weight_30;
   meta.n2n_3_weight_31 = n2n_3_weight_31;
   meta.n2n_3_weight_32 = n2n_3_weight_32;
   meta.n2n_4_weight_1 = n2n_4_weight_1;
   meta.n2n_4_weight_2 = n2n_4_weight_2;
   meta.n2n_4_weight_3 = n2n_4_weight_3;
   meta.n2n_4_weight_4 = n2n_4_weight_4;
   meta.n2n_4_weight_5 = n2n_4_weight_5;
   meta.n2n_4_weight_6 = n2n_4_weight_6;
   meta.n2n_4_weight_7 = n2n_4_weight_7;
   meta.n2n_4_weight_8 = n2n_4_weight_8;
   meta.n2n_4_weight_9 = n2n_4_weight_9;
   meta.n2n_4_weight_10 = n2n_4_weight_10;
   meta.n2n_4_weight_11 = n2n_4_weight_11;
   meta.n2n_4_weight_12 = n2n_4_weight_12;
   meta.n2n_4_weight_13 = n2n_4_weight_13;
   meta.n2n_4_weight_14 = n2n_4_weight_14;
   meta.n2n_4_weight_15 = n2n_4_weight_15;
   meta.n2n_4_weight_16 = n2n_4_weight_16;
   meta.n2n_4_weight_17 = n2n_4_weight_17;
   meta.n2n_4_weight_18 = n2n_4_weight_18;
   meta.n2n_4_weight_19 = n2n_4_weight_19;
   meta.n2n_4_weight_20 = n2n_4_weight_20;
   meta.n2n_4_weight_21 = n2n_4_weight_21;
   meta.n2n_4_weight_22 = n2n_4_weight_22;
   meta.n2n_4_weight_23 = n2n_4_weight_23;
   meta.n2n_4_weight_24 = n2n_4_weight_24;
   meta.n2n_4_weight_25 = n2n_4_weight_25;
   meta.n2n_4_weight_26 = n2n_4_weight_26;
   meta.n2n_4_weight_27 = n2n_4_weight_27;
   meta.n2n_4_weight_28 = n2n_4_weight_28;
   meta.n2n_4_weight_29 = n2n_4_weight_29;
   meta.n2n_4_weight_30 = n2n_4_weight_30;
   meta.n2n_4_weight_31 = n2n_4_weight_31;
   meta.n2n_4_weight_32 = n2n_4_weight_32;
   meta.n2n_5_weight_1 = n2n_5_weight_1;
   meta.n2n_5_weight_2 = n2n_5_weight_2;
   meta.n2n_5_weight_3 = n2n_5_weight_3;
   meta.n2n_5_weight_4 = n2n_5_weight_4;
   meta.n2n_5_weight_5 = n2n_5_weight_5;
   meta.n2n_5_weight_6 = n2n_5_weight_6;
   meta.n2n_5_weight_7 = n2n_5_weight_7;
   meta.n2n_5_weight_8 = n2n_5_weight_8;
   meta.n2n_5_weight_9 = n2n_5_weight_9;
   meta.n2n_5_weight_10 = n2n_5_weight_10;
   meta.n2n_5_weight_11 = n2n_5_weight_11;
   meta.n2n_5_weight_12 = n2n_5_weight_12;
   meta.n2n_5_weight_13 = n2n_5_weight_13;
   meta.n2n_5_weight_14 = n2n_5_weight_14;
   meta.n2n_5_weight_15 = n2n_5_weight_15;
   meta.n2n_5_weight_16 = n2n_5_weight_16;
   meta.n2n_5_weight_17 = n2n_5_weight_17;
   meta.n2n_5_weight_18 = n2n_5_weight_18;
   meta.n2n_5_weight_19 = n2n_5_weight_19;
   meta.n2n_5_weight_20 = n2n_5_weight_20;
   meta.n2n_5_weight_21 = n2n_5_weight_21;
   meta.n2n_5_weight_22 = n2n_5_weight_22;
   meta.n2n_5_weight_23 = n2n_5_weight_23;
   meta.n2n_5_weight_24 = n2n_5_weight_24;
   meta.n2n_5_weight_25 = n2n_5_weight_25;
   meta.n2n_5_weight_26 = n2n_5_weight_26;
   meta.n2n_5_weight_27 = n2n_5_weight_27;
   meta.n2n_5_weight_28 = n2n_5_weight_28;
   meta.n2n_5_weight_29 = n2n_5_weight_29;
   meta.n2n_5_weight_30 = n2n_5_weight_30;
   meta.n2n_5_weight_31 = n2n_5_weight_31;
   meta.n2n_5_weight_32 = n2n_5_weight_32;
   meta.n2n_6_weight_1 = n2n_6_weight_1;
   meta.n2n_6_weight_2 = n2n_6_weight_2;
   meta.n2n_6_weight_3 = n2n_6_weight_3;
   meta.n2n_6_weight_4 = n2n_6_weight_4;
   meta.n2n_6_weight_5 = n2n_6_weight_5;
   meta.n2n_6_weight_6 = n2n_6_weight_6;
   meta.n2n_6_weight_7 = n2n_6_weight_7;
   meta.n2n_6_weight_8 = n2n_6_weight_8;
   meta.n2n_6_weight_9 = n2n_6_weight_9;
   meta.n2n_6_weight_10 = n2n_6_weight_10;
   meta.n2n_6_weight_11 = n2n_6_weight_11;
   meta.n2n_6_weight_12 = n2n_6_weight_12;
   meta.n2n_6_weight_13 = n2n_6_weight_13;
   meta.n2n_6_weight_14 = n2n_6_weight_14;
   meta.n2n_6_weight_15 = n2n_6_weight_15;
   meta.n2n_6_weight_16 = n2n_6_weight_16;
   meta.n2n_6_weight_17 = n2n_6_weight_17;
   meta.n2n_6_weight_18 = n2n_6_weight_18;
   meta.n2n_6_weight_19 = n2n_6_weight_19;
   meta.n2n_6_weight_20 = n2n_6_weight_20;
   meta.n2n_6_weight_21 = n2n_6_weight_21;
   meta.n2n_6_weight_22 = n2n_6_weight_22;
   meta.n2n_6_weight_23 = n2n_6_weight_23;
   meta.n2n_6_weight_24 = n2n_6_weight_24;
   meta.n2n_6_weight_25 = n2n_6_weight_25;
   meta.n2n_6_weight_26 = n2n_6_weight_26;
   meta.n2n_6_weight_27 = n2n_6_weight_27;
   meta.n2n_6_weight_28 = n2n_6_weight_28;
   meta.n2n_6_weight_29 = n2n_6_weight_29;
   meta.n2n_6_weight_30 = n2n_6_weight_30;
   meta.n2n_6_weight_31 = n2n_6_weight_31;
   meta.n2n_6_weight_32 = n2n_6_weight_32;
   meta.n2n_7_weight_1 = n2n_7_weight_1;
   meta.n2n_7_weight_2 = n2n_7_weight_2;
   meta.n2n_7_weight_3 = n2n_7_weight_3;
   meta.n2n_7_weight_4 = n2n_7_weight_4;
   meta.n2n_7_weight_5 = n2n_7_weight_5;
   meta.n2n_7_weight_6 = n2n_7_weight_6;
   meta.n2n_7_weight_7 = n2n_7_weight_7;
   meta.n2n_7_weight_8 = n2n_7_weight_8;
   meta.n2n_7_weight_9 = n2n_7_weight_9;
   meta.n2n_7_weight_10 = n2n_7_weight_10;
   meta.n2n_7_weight_11 = n2n_7_weight_11;
   meta.n2n_7_weight_12 = n2n_7_weight_12;
   meta.n2n_7_weight_13 = n2n_7_weight_13;
   meta.n2n_7_weight_14 = n2n_7_weight_14;
   meta.n2n_7_weight_15 = n2n_7_weight_15;
   meta.n2n_7_weight_16 = n2n_7_weight_16;
   meta.n2n_7_weight_17 = n2n_7_weight_17;
   meta.n2n_7_weight_18 = n2n_7_weight_18;
   meta.n2n_7_weight_19 = n2n_7_weight_19;
   meta.n2n_7_weight_20 = n2n_7_weight_20;
   meta.n2n_7_weight_21 = n2n_7_weight_21;
   meta.n2n_7_weight_22 = n2n_7_weight_22;
   meta.n2n_7_weight_23 = n2n_7_weight_23;
   meta.n2n_7_weight_24 = n2n_7_weight_24;
   meta.n2n_7_weight_25 = n2n_7_weight_25;
   meta.n2n_7_weight_26 = n2n_7_weight_26;
   meta.n2n_7_weight_27 = n2n_7_weight_27;
   meta.n2n_7_weight_28 = n2n_7_weight_28;
   meta.n2n_7_weight_29 = n2n_7_weight_29;
   meta.n2n_7_weight_30 = n2n_7_weight_30;
   meta.n2n_7_weight_31 = n2n_7_weight_31;
   meta.n2n_7_weight_32 = n2n_7_weight_32;
   meta.n2n_8_weight_1 = n2n_8_weight_1;
   meta.n2n_8_weight_2 = n2n_8_weight_2;
   meta.n2n_8_weight_3 = n2n_8_weight_3;
   meta.n2n_8_weight_4 = n2n_8_weight_4;
   meta.n2n_8_weight_5 = n2n_8_weight_5;
   meta.n2n_8_weight_6 = n2n_8_weight_6;
   meta.n2n_8_weight_7 = n2n_8_weight_7;
   meta.n2n_8_weight_8 = n2n_8_weight_8;
   meta.n2n_8_weight_9 = n2n_8_weight_9;
   meta.n2n_8_weight_10 = n2n_8_weight_10;
   meta.n2n_8_weight_11 = n2n_8_weight_11;
   meta.n2n_8_weight_12 = n2n_8_weight_12;
   meta.n2n_8_weight_13 = n2n_8_weight_13;
   meta.n2n_8_weight_14 = n2n_8_weight_14;
   meta.n2n_8_weight_15 = n2n_8_weight_15;
   meta.n2n_8_weight_16 = n2n_8_weight_16;
   meta.n2n_8_weight_17 = n2n_8_weight_17;
   meta.n2n_8_weight_18 = n2n_8_weight_18;
   meta.n2n_8_weight_19 = n2n_8_weight_19;
   meta.n2n_8_weight_20 = n2n_8_weight_20;
   meta.n2n_8_weight_21 = n2n_8_weight_21;
   meta.n2n_8_weight_22 = n2n_8_weight_22;
   meta.n2n_8_weight_23 = n2n_8_weight_23;
   meta.n2n_8_weight_24 = n2n_8_weight_24;
   meta.n2n_8_weight_25 = n2n_8_weight_25;
   meta.n2n_8_weight_26 = n2n_8_weight_26;
   meta.n2n_8_weight_27 = n2n_8_weight_27;
   meta.n2n_8_weight_28 = n2n_8_weight_28;
   meta.n2n_8_weight_29 = n2n_8_weight_29;
   meta.n2n_8_weight_30 = n2n_8_weight_30;
   meta.n2n_8_weight_31 = n2n_8_weight_31;
   meta.n2n_8_weight_32 = n2n_8_weight_32;
   meta.n2n_9_weight_1 = n2n_9_weight_1;
   meta.n2n_9_weight_2 = n2n_9_weight_2;
   meta.n2n_9_weight_3 = n2n_9_weight_3;
   meta.n2n_9_weight_4 = n2n_9_weight_4;
   meta.n2n_9_weight_5 = n2n_9_weight_5;
   meta.n2n_9_weight_6 = n2n_9_weight_6;
   meta.n2n_9_weight_7 = n2n_9_weight_7;
   meta.n2n_9_weight_8 = n2n_9_weight_8;
   meta.n2n_9_weight_9 = n2n_9_weight_9;
   meta.n2n_9_weight_10 = n2n_9_weight_10;
   meta.n2n_9_weight_11 = n2n_9_weight_11;
   meta.n2n_9_weight_12 = n2n_9_weight_12;
   meta.n2n_9_weight_13 = n2n_9_weight_13;
   meta.n2n_9_weight_14 = n2n_9_weight_14;
   meta.n2n_9_weight_15 = n2n_9_weight_15;
   meta.n2n_9_weight_16 = n2n_9_weight_16;
   meta.n2n_9_weight_17 = n2n_9_weight_17;
   meta.n2n_9_weight_18 = n2n_9_weight_18;
   meta.n2n_9_weight_19 = n2n_9_weight_19;
   meta.n2n_9_weight_20 = n2n_9_weight_20;
   meta.n2n_9_weight_21 = n2n_9_weight_21;
   meta.n2n_9_weight_22 = n2n_9_weight_22;
   meta.n2n_9_weight_23 = n2n_9_weight_23;
   meta.n2n_9_weight_24 = n2n_9_weight_24;
   meta.n2n_9_weight_25 = n2n_9_weight_25;
   meta.n2n_9_weight_26 = n2n_9_weight_26;
   meta.n2n_9_weight_27 = n2n_9_weight_27;
   meta.n2n_9_weight_28 = n2n_9_weight_28;
   meta.n2n_9_weight_29 = n2n_9_weight_29;
   meta.n2n_9_weight_30 = n2n_9_weight_30;
   meta.n2n_9_weight_31 = n2n_9_weight_31;
   meta.n2n_9_weight_32 = n2n_9_weight_32;
   meta.n2n_10_weight_1 = n2n_10_weight_1;
   meta.n2n_10_weight_2 = n2n_10_weight_2;
   meta.n2n_10_weight_3 = n2n_10_weight_3;
   meta.n2n_10_weight_4 = n2n_10_weight_4;
   meta.n2n_10_weight_5 = n2n_10_weight_5;
   meta.n2n_10_weight_6 = n2n_10_weight_6;
   meta.n2n_10_weight_7 = n2n_10_weight_7;
   meta.n2n_10_weight_8 = n2n_10_weight_8;
   meta.n2n_10_weight_9 = n2n_10_weight_9;
   meta.n2n_10_weight_10 = n2n_10_weight_10;
   meta.n2n_10_weight_11 = n2n_10_weight_11;
   meta.n2n_10_weight_12 = n2n_10_weight_12;
   meta.n2n_10_weight_13 = n2n_10_weight_13;
   meta.n2n_10_weight_14 = n2n_10_weight_14;
   meta.n2n_10_weight_15 = n2n_10_weight_15;
   meta.n2n_10_weight_16 = n2n_10_weight_16;
   meta.n2n_10_weight_17 = n2n_10_weight_17;
   meta.n2n_10_weight_18 = n2n_10_weight_18;
   meta.n2n_10_weight_19 = n2n_10_weight_19;
   meta.n2n_10_weight_20 = n2n_10_weight_20;
   meta.n2n_10_weight_21 = n2n_10_weight_21;
   meta.n2n_10_weight_22 = n2n_10_weight_22;
   meta.n2n_10_weight_23 = n2n_10_weight_23;
   meta.n2n_10_weight_24 = n2n_10_weight_24;
   meta.n2n_10_weight_25 = n2n_10_weight_25;
   meta.n2n_10_weight_26 = n2n_10_weight_26;
   meta.n2n_10_weight_27 = n2n_10_weight_27;
   meta.n2n_10_weight_28 = n2n_10_weight_28;
   meta.n2n_10_weight_29 = n2n_10_weight_29;
   meta.n2n_10_weight_30 = n2n_10_weight_30;
   meta.n2n_10_weight_31 = n2n_10_weight_31;
   meta.n2n_10_weight_32 = n2n_10_weight_32;
   meta.n2n_11_weight_1 = n2n_11_weight_1;
   meta.n2n_11_weight_2 = n2n_11_weight_2;
   meta.n2n_11_weight_3 = n2n_11_weight_3;
   meta.n2n_11_weight_4 = n2n_11_weight_4;
   meta.n2n_11_weight_5 = n2n_11_weight_5;
   meta.n2n_11_weight_6 = n2n_11_weight_6;
   meta.n2n_11_weight_7 = n2n_11_weight_7;
   meta.n2n_11_weight_8 = n2n_11_weight_8;
   meta.n2n_11_weight_9 = n2n_11_weight_9;
   meta.n2n_11_weight_10 = n2n_11_weight_10;
   meta.n2n_11_weight_11 = n2n_11_weight_11;
   meta.n2n_11_weight_12 = n2n_11_weight_12;
   meta.n2n_11_weight_13 = n2n_11_weight_13;
   meta.n2n_11_weight_14 = n2n_11_weight_14;
   meta.n2n_11_weight_15 = n2n_11_weight_15;
   meta.n2n_11_weight_16 = n2n_11_weight_16;
   meta.n2n_11_weight_17 = n2n_11_weight_17;
   meta.n2n_11_weight_18 = n2n_11_weight_18;
   meta.n2n_11_weight_19 = n2n_11_weight_19;
   meta.n2n_11_weight_20 = n2n_11_weight_20;
   meta.n2n_11_weight_21 = n2n_11_weight_21;
   meta.n2n_11_weight_22 = n2n_11_weight_22;
   meta.n2n_11_weight_23 = n2n_11_weight_23;
   meta.n2n_11_weight_24 = n2n_11_weight_24;
   meta.n2n_11_weight_25 = n2n_11_weight_25;
   meta.n2n_11_weight_26 = n2n_11_weight_26;
   meta.n2n_11_weight_27 = n2n_11_weight_27;
   meta.n2n_11_weight_28 = n2n_11_weight_28;
   meta.n2n_11_weight_29 = n2n_11_weight_29;
   meta.n2n_11_weight_30 = n2n_11_weight_30;
   meta.n2n_11_weight_31 = n2n_11_weight_31;
   meta.n2n_11_weight_32 = n2n_11_weight_32;
   meta.n2n_12_weight_1 = n2n_12_weight_1;
   meta.n2n_12_weight_2 = n2n_12_weight_2;
   meta.n2n_12_weight_3 = n2n_12_weight_3;
   meta.n2n_12_weight_4 = n2n_12_weight_4;
   meta.n2n_12_weight_5 = n2n_12_weight_5;
   meta.n2n_12_weight_6 = n2n_12_weight_6;
   meta.n2n_12_weight_7 = n2n_12_weight_7;
   meta.n2n_12_weight_8 = n2n_12_weight_8;
   meta.n2n_12_weight_9 = n2n_12_weight_9;
   meta.n2n_12_weight_10 = n2n_12_weight_10;
   meta.n2n_12_weight_11 = n2n_12_weight_11;
   meta.n2n_12_weight_12 = n2n_12_weight_12;
   meta.n2n_12_weight_13 = n2n_12_weight_13;
   meta.n2n_12_weight_14 = n2n_12_weight_14;
   meta.n2n_12_weight_15 = n2n_12_weight_15;
   meta.n2n_12_weight_16 = n2n_12_weight_16;
   meta.n2n_12_weight_17 = n2n_12_weight_17;
   meta.n2n_12_weight_18 = n2n_12_weight_18;
   meta.n2n_12_weight_19 = n2n_12_weight_19;
   meta.n2n_12_weight_20 = n2n_12_weight_20;
   meta.n2n_12_weight_21 = n2n_12_weight_21;
   meta.n2n_12_weight_22 = n2n_12_weight_22;
   meta.n2n_12_weight_23 = n2n_12_weight_23;
   meta.n2n_12_weight_24 = n2n_12_weight_24;
   meta.n2n_12_weight_25 = n2n_12_weight_25;
   meta.n2n_12_weight_26 = n2n_12_weight_26;
   meta.n2n_12_weight_27 = n2n_12_weight_27;
   meta.n2n_12_weight_28 = n2n_12_weight_28;
   meta.n2n_12_weight_29 = n2n_12_weight_29;
   meta.n2n_12_weight_30 = n2n_12_weight_30;
   meta.n2n_12_weight_31 = n2n_12_weight_31;
   meta.n2n_12_weight_32 = n2n_12_weight_32;
   meta.n2n_13_weight_1 = n2n_13_weight_1;
   meta.n2n_13_weight_2 = n2n_13_weight_2;
   meta.n2n_13_weight_3 = n2n_13_weight_3;
   meta.n2n_13_weight_4 = n2n_13_weight_4;
   meta.n2n_13_weight_5 = n2n_13_weight_5;
   meta.n2n_13_weight_6 = n2n_13_weight_6;
   meta.n2n_13_weight_7 = n2n_13_weight_7;
   meta.n2n_13_weight_8 = n2n_13_weight_8;
   meta.n2n_13_weight_9 = n2n_13_weight_9;
   meta.n2n_13_weight_10 = n2n_13_weight_10;
   meta.n2n_13_weight_11 = n2n_13_weight_11;
   meta.n2n_13_weight_12 = n2n_13_weight_12;
   meta.n2n_13_weight_13 = n2n_13_weight_13;
   meta.n2n_13_weight_14 = n2n_13_weight_14;
   meta.n2n_13_weight_15 = n2n_13_weight_15;
   meta.n2n_13_weight_16 = n2n_13_weight_16;
   meta.n2n_13_weight_17 = n2n_13_weight_17;
   meta.n2n_13_weight_18 = n2n_13_weight_18;
   meta.n2n_13_weight_19 = n2n_13_weight_19;
   meta.n2n_13_weight_20 = n2n_13_weight_20;
   meta.n2n_13_weight_21 = n2n_13_weight_21;
   meta.n2n_13_weight_22 = n2n_13_weight_22;
   meta.n2n_13_weight_23 = n2n_13_weight_23;
   meta.n2n_13_weight_24 = n2n_13_weight_24;
   meta.n2n_13_weight_25 = n2n_13_weight_25;
   meta.n2n_13_weight_26 = n2n_13_weight_26;
   meta.n2n_13_weight_27 = n2n_13_weight_27;
   meta.n2n_13_weight_28 = n2n_13_weight_28;
   meta.n2n_13_weight_29 = n2n_13_weight_29;
   meta.n2n_13_weight_30 = n2n_13_weight_30;
   meta.n2n_13_weight_31 = n2n_13_weight_31;
   meta.n2n_13_weight_32 = n2n_13_weight_32;
   meta.n2n_14_weight_1 = n2n_14_weight_1;
   meta.n2n_14_weight_2 = n2n_14_weight_2;
   meta.n2n_14_weight_3 = n2n_14_weight_3;
   meta.n2n_14_weight_4 = n2n_14_weight_4;
   meta.n2n_14_weight_5 = n2n_14_weight_5;
   meta.n2n_14_weight_6 = n2n_14_weight_6;
   meta.n2n_14_weight_7 = n2n_14_weight_7;
   meta.n2n_14_weight_8 = n2n_14_weight_8;
   meta.n2n_14_weight_9 = n2n_14_weight_9;
   meta.n2n_14_weight_10 = n2n_14_weight_10;
   meta.n2n_14_weight_11 = n2n_14_weight_11;
   meta.n2n_14_weight_12 = n2n_14_weight_12;
   meta.n2n_14_weight_13 = n2n_14_weight_13;
   meta.n2n_14_weight_14 = n2n_14_weight_14;
   meta.n2n_14_weight_15 = n2n_14_weight_15;
   meta.n2n_14_weight_16 = n2n_14_weight_16;
   meta.n2n_14_weight_17 = n2n_14_weight_17;
   meta.n2n_14_weight_18 = n2n_14_weight_18;
   meta.n2n_14_weight_19 = n2n_14_weight_19;
   meta.n2n_14_weight_20 = n2n_14_weight_20;
   meta.n2n_14_weight_21 = n2n_14_weight_21;
   meta.n2n_14_weight_22 = n2n_14_weight_22;
   meta.n2n_14_weight_23 = n2n_14_weight_23;
   meta.n2n_14_weight_24 = n2n_14_weight_24;
   meta.n2n_14_weight_25 = n2n_14_weight_25;
   meta.n2n_14_weight_26 = n2n_14_weight_26;
   meta.n2n_14_weight_27 = n2n_14_weight_27;
   meta.n2n_14_weight_28 = n2n_14_weight_28;
   meta.n2n_14_weight_29 = n2n_14_weight_29;
   meta.n2n_14_weight_30 = n2n_14_weight_30;
   meta.n2n_14_weight_31 = n2n_14_weight_31;
   meta.n2n_14_weight_32 = n2n_14_weight_32;
   meta.n2n_15_weight_1 = n2n_15_weight_1;
   meta.n2n_15_weight_2 = n2n_15_weight_2;
   meta.n2n_15_weight_3 = n2n_15_weight_3;
   meta.n2n_15_weight_4 = n2n_15_weight_4;
   meta.n2n_15_weight_5 = n2n_15_weight_5;
   meta.n2n_15_weight_6 = n2n_15_weight_6;
   meta.n2n_15_weight_7 = n2n_15_weight_7;
   meta.n2n_15_weight_8 = n2n_15_weight_8;
   meta.n2n_15_weight_9 = n2n_15_weight_9;
   meta.n2n_15_weight_10 = n2n_15_weight_10;
   meta.n2n_15_weight_11 = n2n_15_weight_11;
   meta.n2n_15_weight_12 = n2n_15_weight_12;
   meta.n2n_15_weight_13 = n2n_15_weight_13;
   meta.n2n_15_weight_14 = n2n_15_weight_14;
   meta.n2n_15_weight_15 = n2n_15_weight_15;
   meta.n2n_15_weight_16 = n2n_15_weight_16;
   meta.n2n_15_weight_17 = n2n_15_weight_17;
   meta.n2n_15_weight_18 = n2n_15_weight_18;
   meta.n2n_15_weight_19 = n2n_15_weight_19;
   meta.n2n_15_weight_20 = n2n_15_weight_20;
   meta.n2n_15_weight_21 = n2n_15_weight_21;
   meta.n2n_15_weight_22 = n2n_15_weight_22;
   meta.n2n_15_weight_23 = n2n_15_weight_23;
   meta.n2n_15_weight_24 = n2n_15_weight_24;
   meta.n2n_15_weight_25 = n2n_15_weight_25;
   meta.n2n_15_weight_26 = n2n_15_weight_26;
   meta.n2n_15_weight_27 = n2n_15_weight_27;
   meta.n2n_15_weight_28 = n2n_15_weight_28;
   meta.n2n_15_weight_29 = n2n_15_weight_29;
   meta.n2n_15_weight_30 = n2n_15_weight_30;
   meta.n2n_15_weight_31 = n2n_15_weight_31;
   meta.n2n_15_weight_32 = n2n_15_weight_32;
   meta.n2n_16_weight_1 = n2n_16_weight_1;
   meta.n2n_16_weight_2 = n2n_16_weight_2;
   meta.n2n_16_weight_3 = n2n_16_weight_3;
   meta.n2n_16_weight_4 = n2n_16_weight_4;
   meta.n2n_16_weight_5 = n2n_16_weight_5;
   meta.n2n_16_weight_6 = n2n_16_weight_6;
   meta.n2n_16_weight_7 = n2n_16_weight_7;
   meta.n2n_16_weight_8 = n2n_16_weight_8;
   meta.n2n_16_weight_9 = n2n_16_weight_9;
   meta.n2n_16_weight_10 = n2n_16_weight_10;
   meta.n2n_16_weight_11 = n2n_16_weight_11;
   meta.n2n_16_weight_12 = n2n_16_weight_12;
   meta.n2n_16_weight_13 = n2n_16_weight_13;
   meta.n2n_16_weight_14 = n2n_16_weight_14;
   meta.n2n_16_weight_15 = n2n_16_weight_15;
   meta.n2n_16_weight_16 = n2n_16_weight_16;
   meta.n2n_16_weight_17 = n2n_16_weight_17;
   meta.n2n_16_weight_18 = n2n_16_weight_18;
   meta.n2n_16_weight_19 = n2n_16_weight_19;
   meta.n2n_16_weight_20 = n2n_16_weight_20;
   meta.n2n_16_weight_21 = n2n_16_weight_21;
   meta.n2n_16_weight_22 = n2n_16_weight_22;
   meta.n2n_16_weight_23 = n2n_16_weight_23;
   meta.n2n_16_weight_24 = n2n_16_weight_24;
   meta.n2n_16_weight_25 = n2n_16_weight_25;
   meta.n2n_16_weight_26 = n2n_16_weight_26;
   meta.n2n_16_weight_27 = n2n_16_weight_27;
   meta.n2n_16_weight_28 = n2n_16_weight_28;
   meta.n2n_16_weight_29 = n2n_16_weight_29;
   meta.n2n_16_weight_30 = n2n_16_weight_30;
   meta.n2n_16_weight_31 = n2n_16_weight_31;
   meta.n2n_16_weight_32 = n2n_16_weight_32;
   meta.n2n_17_weight_1 = n2n_17_weight_1;
   meta.n2n_17_weight_2 = n2n_17_weight_2;
   meta.n2n_17_weight_3 = n2n_17_weight_3;
   meta.n2n_17_weight_4 = n2n_17_weight_4;
   meta.n2n_17_weight_5 = n2n_17_weight_5;
   meta.n2n_17_weight_6 = n2n_17_weight_6;
   meta.n2n_17_weight_7 = n2n_17_weight_7;
   meta.n2n_17_weight_8 = n2n_17_weight_8;
   meta.n2n_17_weight_9 = n2n_17_weight_9;
   meta.n2n_17_weight_10 = n2n_17_weight_10;
   meta.n2n_17_weight_11 = n2n_17_weight_11;
   meta.n2n_17_weight_12 = n2n_17_weight_12;
   meta.n2n_17_weight_13 = n2n_17_weight_13;
   meta.n2n_17_weight_14 = n2n_17_weight_14;
   meta.n2n_17_weight_15 = n2n_17_weight_15;
   meta.n2n_17_weight_16 = n2n_17_weight_16;
   meta.n2n_17_weight_17 = n2n_17_weight_17;
   meta.n2n_17_weight_18 = n2n_17_weight_18;
   meta.n2n_17_weight_19 = n2n_17_weight_19;
   meta.n2n_17_weight_20 = n2n_17_weight_20;
   meta.n2n_17_weight_21 = n2n_17_weight_21;
   meta.n2n_17_weight_22 = n2n_17_weight_22;
   meta.n2n_17_weight_23 = n2n_17_weight_23;
   meta.n2n_17_weight_24 = n2n_17_weight_24;
   meta.n2n_17_weight_25 = n2n_17_weight_25;
   meta.n2n_17_weight_26 = n2n_17_weight_26;
   meta.n2n_17_weight_27 = n2n_17_weight_27;
   meta.n2n_17_weight_28 = n2n_17_weight_28;
   meta.n2n_17_weight_29 = n2n_17_weight_29;
   meta.n2n_17_weight_30 = n2n_17_weight_30;
   meta.n2n_17_weight_31 = n2n_17_weight_31;
   meta.n2n_17_weight_32 = n2n_17_weight_32;
   meta.n2n_18_weight_1 = n2n_18_weight_1;
   meta.n2n_18_weight_2 = n2n_18_weight_2;
   meta.n2n_18_weight_3 = n2n_18_weight_3;
   meta.n2n_18_weight_4 = n2n_18_weight_4;
   meta.n2n_18_weight_5 = n2n_18_weight_5;
   meta.n2n_18_weight_6 = n2n_18_weight_6;
   meta.n2n_18_weight_7 = n2n_18_weight_7;
   meta.n2n_18_weight_8 = n2n_18_weight_8;
   meta.n2n_18_weight_9 = n2n_18_weight_9;
   meta.n2n_18_weight_10 = n2n_18_weight_10;
   meta.n2n_18_weight_11 = n2n_18_weight_11;
   meta.n2n_18_weight_12 = n2n_18_weight_12;
   meta.n2n_18_weight_13 = n2n_18_weight_13;
   meta.n2n_18_weight_14 = n2n_18_weight_14;
   meta.n2n_18_weight_15 = n2n_18_weight_15;
   meta.n2n_18_weight_16 = n2n_18_weight_16;
   meta.n2n_18_weight_17 = n2n_18_weight_17;
   meta.n2n_18_weight_18 = n2n_18_weight_18;
   meta.n2n_18_weight_19 = n2n_18_weight_19;
   meta.n2n_18_weight_20 = n2n_18_weight_20;
   meta.n2n_18_weight_21 = n2n_18_weight_21;
   meta.n2n_18_weight_22 = n2n_18_weight_22;
   meta.n2n_18_weight_23 = n2n_18_weight_23;
   meta.n2n_18_weight_24 = n2n_18_weight_24;
   meta.n2n_18_weight_25 = n2n_18_weight_25;
   meta.n2n_18_weight_26 = n2n_18_weight_26;
   meta.n2n_18_weight_27 = n2n_18_weight_27;
   meta.n2n_18_weight_28 = n2n_18_weight_28;
   meta.n2n_18_weight_29 = n2n_18_weight_29;
   meta.n2n_18_weight_30 = n2n_18_weight_30;
   meta.n2n_18_weight_31 = n2n_18_weight_31;
   meta.n2n_18_weight_32 = n2n_18_weight_32;
   meta.n2n_19_weight_1 = n2n_19_weight_1;
   meta.n2n_19_weight_2 = n2n_19_weight_2;
   meta.n2n_19_weight_3 = n2n_19_weight_3;
   meta.n2n_19_weight_4 = n2n_19_weight_4;
   meta.n2n_19_weight_5 = n2n_19_weight_5;
   meta.n2n_19_weight_6 = n2n_19_weight_6;
   meta.n2n_19_weight_7 = n2n_19_weight_7;
   meta.n2n_19_weight_8 = n2n_19_weight_8;
   meta.n2n_19_weight_9 = n2n_19_weight_9;
   meta.n2n_19_weight_10 = n2n_19_weight_10;
   meta.n2n_19_weight_11 = n2n_19_weight_11;
   meta.n2n_19_weight_12 = n2n_19_weight_12;
   meta.n2n_19_weight_13 = n2n_19_weight_13;
   meta.n2n_19_weight_14 = n2n_19_weight_14;
   meta.n2n_19_weight_15 = n2n_19_weight_15;
   meta.n2n_19_weight_16 = n2n_19_weight_16;
   meta.n2n_19_weight_17 = n2n_19_weight_17;
   meta.n2n_19_weight_18 = n2n_19_weight_18;
   meta.n2n_19_weight_19 = n2n_19_weight_19;
   meta.n2n_19_weight_20 = n2n_19_weight_20;
   meta.n2n_19_weight_21 = n2n_19_weight_21;
   meta.n2n_19_weight_22 = n2n_19_weight_22;
   meta.n2n_19_weight_23 = n2n_19_weight_23;
   meta.n2n_19_weight_24 = n2n_19_weight_24;
   meta.n2n_19_weight_25 = n2n_19_weight_25;
   meta.n2n_19_weight_26 = n2n_19_weight_26;
   meta.n2n_19_weight_27 = n2n_19_weight_27;
   meta.n2n_19_weight_28 = n2n_19_weight_28;
   meta.n2n_19_weight_29 = n2n_19_weight_29;
   meta.n2n_19_weight_30 = n2n_19_weight_30;
   meta.n2n_19_weight_31 = n2n_19_weight_31;
   meta.n2n_19_weight_32 = n2n_19_weight_32;
   meta.n2n_20_weight_1 = n2n_20_weight_1;
   meta.n2n_20_weight_2 = n2n_20_weight_2;
   meta.n2n_20_weight_3 = n2n_20_weight_3;
   meta.n2n_20_weight_4 = n2n_20_weight_4;
   meta.n2n_20_weight_5 = n2n_20_weight_5;
   meta.n2n_20_weight_6 = n2n_20_weight_6;
   meta.n2n_20_weight_7 = n2n_20_weight_7;
   meta.n2n_20_weight_8 = n2n_20_weight_8;
   meta.n2n_20_weight_9 = n2n_20_weight_9;
   meta.n2n_20_weight_10 = n2n_20_weight_10;
   meta.n2n_20_weight_11 = n2n_20_weight_11;
   meta.n2n_20_weight_12 = n2n_20_weight_12;
   meta.n2n_20_weight_13 = n2n_20_weight_13;
   meta.n2n_20_weight_14 = n2n_20_weight_14;
   meta.n2n_20_weight_15 = n2n_20_weight_15;
   meta.n2n_20_weight_16 = n2n_20_weight_16;
   meta.n2n_20_weight_17 = n2n_20_weight_17;
   meta.n2n_20_weight_18 = n2n_20_weight_18;
   meta.n2n_20_weight_19 = n2n_20_weight_19;
   meta.n2n_20_weight_20 = n2n_20_weight_20;
   meta.n2n_20_weight_21 = n2n_20_weight_21;
   meta.n2n_20_weight_22 = n2n_20_weight_22;
   meta.n2n_20_weight_23 = n2n_20_weight_23;
   meta.n2n_20_weight_24 = n2n_20_weight_24;
   meta.n2n_20_weight_25 = n2n_20_weight_25;
   meta.n2n_20_weight_26 = n2n_20_weight_26;
   meta.n2n_20_weight_27 = n2n_20_weight_27;
   meta.n2n_20_weight_28 = n2n_20_weight_28;
   meta.n2n_20_weight_29 = n2n_20_weight_29;
   meta.n2n_20_weight_30 = n2n_20_weight_30;
   meta.n2n_20_weight_31 = n2n_20_weight_31;
   meta.n2n_20_weight_32 = n2n_20_weight_32;
   meta.n2n_21_weight_1 = n2n_21_weight_1;
   meta.n2n_21_weight_2 = n2n_21_weight_2;
   meta.n2n_21_weight_3 = n2n_21_weight_3;
   meta.n2n_21_weight_4 = n2n_21_weight_4;
   meta.n2n_21_weight_5 = n2n_21_weight_5;
   meta.n2n_21_weight_6 = n2n_21_weight_6;
   meta.n2n_21_weight_7 = n2n_21_weight_7;
   meta.n2n_21_weight_8 = n2n_21_weight_8;
   meta.n2n_21_weight_9 = n2n_21_weight_9;
   meta.n2n_21_weight_10 = n2n_21_weight_10;
   meta.n2n_21_weight_11 = n2n_21_weight_11;
   meta.n2n_21_weight_12 = n2n_21_weight_12;
   meta.n2n_21_weight_13 = n2n_21_weight_13;
   meta.n2n_21_weight_14 = n2n_21_weight_14;
   meta.n2n_21_weight_15 = n2n_21_weight_15;
   meta.n2n_21_weight_16 = n2n_21_weight_16;
   meta.n2n_21_weight_17 = n2n_21_weight_17;
   meta.n2n_21_weight_18 = n2n_21_weight_18;
   meta.n2n_21_weight_19 = n2n_21_weight_19;
   meta.n2n_21_weight_20 = n2n_21_weight_20;
   meta.n2n_21_weight_21 = n2n_21_weight_21;
   meta.n2n_21_weight_22 = n2n_21_weight_22;
   meta.n2n_21_weight_23 = n2n_21_weight_23;
   meta.n2n_21_weight_24 = n2n_21_weight_24;
   meta.n2n_21_weight_25 = n2n_21_weight_25;
   meta.n2n_21_weight_26 = n2n_21_weight_26;
   meta.n2n_21_weight_27 = n2n_21_weight_27;
   meta.n2n_21_weight_28 = n2n_21_weight_28;
   meta.n2n_21_weight_29 = n2n_21_weight_29;
   meta.n2n_21_weight_30 = n2n_21_weight_30;
   meta.n2n_21_weight_31 = n2n_21_weight_31;
   meta.n2n_21_weight_32 = n2n_21_weight_32;
   meta.n2n_22_weight_1 = n2n_22_weight_1;
   meta.n2n_22_weight_2 = n2n_22_weight_2;
   meta.n2n_22_weight_3 = n2n_22_weight_3;
   meta.n2n_22_weight_4 = n2n_22_weight_4;
   meta.n2n_22_weight_5 = n2n_22_weight_5;
   meta.n2n_22_weight_6 = n2n_22_weight_6;
   meta.n2n_22_weight_7 = n2n_22_weight_7;
   meta.n2n_22_weight_8 = n2n_22_weight_8;
   meta.n2n_22_weight_9 = n2n_22_weight_9;
   meta.n2n_22_weight_10 = n2n_22_weight_10;
   meta.n2n_22_weight_11 = n2n_22_weight_11;
   meta.n2n_22_weight_12 = n2n_22_weight_12;
   meta.n2n_22_weight_13 = n2n_22_weight_13;
   meta.n2n_22_weight_14 = n2n_22_weight_14;
   meta.n2n_22_weight_15 = n2n_22_weight_15;
   meta.n2n_22_weight_16 = n2n_22_weight_16;
   meta.n2n_22_weight_17 = n2n_22_weight_17;
   meta.n2n_22_weight_18 = n2n_22_weight_18;
   meta.n2n_22_weight_19 = n2n_22_weight_19;
   meta.n2n_22_weight_20 = n2n_22_weight_20;
   meta.n2n_22_weight_21 = n2n_22_weight_21;
   meta.n2n_22_weight_22 = n2n_22_weight_22;
   meta.n2n_22_weight_23 = n2n_22_weight_23;
   meta.n2n_22_weight_24 = n2n_22_weight_24;
   meta.n2n_22_weight_25 = n2n_22_weight_25;
   meta.n2n_22_weight_26 = n2n_22_weight_26;
   meta.n2n_22_weight_27 = n2n_22_weight_27;
   meta.n2n_22_weight_28 = n2n_22_weight_28;
   meta.n2n_22_weight_29 = n2n_22_weight_29;
   meta.n2n_22_weight_30 = n2n_22_weight_30;
   meta.n2n_22_weight_31 = n2n_22_weight_31;
   meta.n2n_22_weight_32 = n2n_22_weight_32;
   meta.n2n_23_weight_1 = n2n_23_weight_1;
   meta.n2n_23_weight_2 = n2n_23_weight_2;
   meta.n2n_23_weight_3 = n2n_23_weight_3;
   meta.n2n_23_weight_4 = n2n_23_weight_4;
   meta.n2n_23_weight_5 = n2n_23_weight_5;
   meta.n2n_23_weight_6 = n2n_23_weight_6;
   meta.n2n_23_weight_7 = n2n_23_weight_7;
   meta.n2n_23_weight_8 = n2n_23_weight_8;
   meta.n2n_23_weight_9 = n2n_23_weight_9;
   meta.n2n_23_weight_10 = n2n_23_weight_10;
   meta.n2n_23_weight_11 = n2n_23_weight_11;
   meta.n2n_23_weight_12 = n2n_23_weight_12;
   meta.n2n_23_weight_13 = n2n_23_weight_13;
   meta.n2n_23_weight_14 = n2n_23_weight_14;
   meta.n2n_23_weight_15 = n2n_23_weight_15;
   meta.n2n_23_weight_16 = n2n_23_weight_16;
   meta.n2n_23_weight_17 = n2n_23_weight_17;
   meta.n2n_23_weight_18 = n2n_23_weight_18;
   meta.n2n_23_weight_19 = n2n_23_weight_19;
   meta.n2n_23_weight_20 = n2n_23_weight_20;
   meta.n2n_23_weight_21 = n2n_23_weight_21;
   meta.n2n_23_weight_22 = n2n_23_weight_22;
   meta.n2n_23_weight_23 = n2n_23_weight_23;
   meta.n2n_23_weight_24 = n2n_23_weight_24;
   meta.n2n_23_weight_25 = n2n_23_weight_25;
   meta.n2n_23_weight_26 = n2n_23_weight_26;
   meta.n2n_23_weight_27 = n2n_23_weight_27;
   meta.n2n_23_weight_28 = n2n_23_weight_28;
   meta.n2n_23_weight_29 = n2n_23_weight_29;
   meta.n2n_23_weight_30 = n2n_23_weight_30;
   meta.n2n_23_weight_31 = n2n_23_weight_31;
   meta.n2n_23_weight_32 = n2n_23_weight_32;
   meta.n2n_24_weight_1 = n2n_24_weight_1;
   meta.n2n_24_weight_2 = n2n_24_weight_2;
   meta.n2n_24_weight_3 = n2n_24_weight_3;
   meta.n2n_24_weight_4 = n2n_24_weight_4;
   meta.n2n_24_weight_5 = n2n_24_weight_5;
   meta.n2n_24_weight_6 = n2n_24_weight_6;
   meta.n2n_24_weight_7 = n2n_24_weight_7;
   meta.n2n_24_weight_8 = n2n_24_weight_8;
   meta.n2n_24_weight_9 = n2n_24_weight_9;
   meta.n2n_24_weight_10 = n2n_24_weight_10;
   meta.n2n_24_weight_11 = n2n_24_weight_11;
   meta.n2n_24_weight_12 = n2n_24_weight_12;
   meta.n2n_24_weight_13 = n2n_24_weight_13;
   meta.n2n_24_weight_14 = n2n_24_weight_14;
   meta.n2n_24_weight_15 = n2n_24_weight_15;
   meta.n2n_24_weight_16 = n2n_24_weight_16;
   meta.n2n_24_weight_17 = n2n_24_weight_17;
   meta.n2n_24_weight_18 = n2n_24_weight_18;
   meta.n2n_24_weight_19 = n2n_24_weight_19;
   meta.n2n_24_weight_20 = n2n_24_weight_20;
   meta.n2n_24_weight_21 = n2n_24_weight_21;
   meta.n2n_24_weight_22 = n2n_24_weight_22;
   meta.n2n_24_weight_23 = n2n_24_weight_23;
   meta.n2n_24_weight_24 = n2n_24_weight_24;
   meta.n2n_24_weight_25 = n2n_24_weight_25;
   meta.n2n_24_weight_26 = n2n_24_weight_26;
   meta.n2n_24_weight_27 = n2n_24_weight_27;
   meta.n2n_24_weight_28 = n2n_24_weight_28;
   meta.n2n_24_weight_29 = n2n_24_weight_29;
   meta.n2n_24_weight_30 = n2n_24_weight_30;
   meta.n2n_24_weight_31 = n2n_24_weight_31;
   meta.n2n_24_weight_32 = n2n_24_weight_32;
   meta.n2n_25_weight_1 = n2n_25_weight_1;
   meta.n2n_25_weight_2 = n2n_25_weight_2;
   meta.n2n_25_weight_3 = n2n_25_weight_3;
   meta.n2n_25_weight_4 = n2n_25_weight_4;
   meta.n2n_25_weight_5 = n2n_25_weight_5;
   meta.n2n_25_weight_6 = n2n_25_weight_6;
   meta.n2n_25_weight_7 = n2n_25_weight_7;
   meta.n2n_25_weight_8 = n2n_25_weight_8;
   meta.n2n_25_weight_9 = n2n_25_weight_9;
   meta.n2n_25_weight_10 = n2n_25_weight_10;
   meta.n2n_25_weight_11 = n2n_25_weight_11;
   meta.n2n_25_weight_12 = n2n_25_weight_12;
   meta.n2n_25_weight_13 = n2n_25_weight_13;
   meta.n2n_25_weight_14 = n2n_25_weight_14;
   meta.n2n_25_weight_15 = n2n_25_weight_15;
   meta.n2n_25_weight_16 = n2n_25_weight_16;
   meta.n2n_25_weight_17 = n2n_25_weight_17;
   meta.n2n_25_weight_18 = n2n_25_weight_18;
   meta.n2n_25_weight_19 = n2n_25_weight_19;
   meta.n2n_25_weight_20 = n2n_25_weight_20;
   meta.n2n_25_weight_21 = n2n_25_weight_21;
   meta.n2n_25_weight_22 = n2n_25_weight_22;
   meta.n2n_25_weight_23 = n2n_25_weight_23;
   meta.n2n_25_weight_24 = n2n_25_weight_24;
   meta.n2n_25_weight_25 = n2n_25_weight_25;
   meta.n2n_25_weight_26 = n2n_25_weight_26;
   meta.n2n_25_weight_27 = n2n_25_weight_27;
   meta.n2n_25_weight_28 = n2n_25_weight_28;
   meta.n2n_25_weight_29 = n2n_25_weight_29;
   meta.n2n_25_weight_30 = n2n_25_weight_30;
   meta.n2n_25_weight_31 = n2n_25_weight_31;
   meta.n2n_25_weight_32 = n2n_25_weight_32;
   meta.n2n_26_weight_1 = n2n_26_weight_1;
   meta.n2n_26_weight_2 = n2n_26_weight_2;
   meta.n2n_26_weight_3 = n2n_26_weight_3;
   meta.n2n_26_weight_4 = n2n_26_weight_4;
   meta.n2n_26_weight_5 = n2n_26_weight_5;
   meta.n2n_26_weight_6 = n2n_26_weight_6;
   meta.n2n_26_weight_7 = n2n_26_weight_7;
   meta.n2n_26_weight_8 = n2n_26_weight_8;
   meta.n2n_26_weight_9 = n2n_26_weight_9;
   meta.n2n_26_weight_10 = n2n_26_weight_10;
   meta.n2n_26_weight_11 = n2n_26_weight_11;
   meta.n2n_26_weight_12 = n2n_26_weight_12;
   meta.n2n_26_weight_13 = n2n_26_weight_13;
   meta.n2n_26_weight_14 = n2n_26_weight_14;
   meta.n2n_26_weight_15 = n2n_26_weight_15;
   meta.n2n_26_weight_16 = n2n_26_weight_16;
   meta.n2n_26_weight_17 = n2n_26_weight_17;
   meta.n2n_26_weight_18 = n2n_26_weight_18;
   meta.n2n_26_weight_19 = n2n_26_weight_19;
   meta.n2n_26_weight_20 = n2n_26_weight_20;
   meta.n2n_26_weight_21 = n2n_26_weight_21;
   meta.n2n_26_weight_22 = n2n_26_weight_22;
   meta.n2n_26_weight_23 = n2n_26_weight_23;
   meta.n2n_26_weight_24 = n2n_26_weight_24;
   meta.n2n_26_weight_25 = n2n_26_weight_25;
   meta.n2n_26_weight_26 = n2n_26_weight_26;
   meta.n2n_26_weight_27 = n2n_26_weight_27;
   meta.n2n_26_weight_28 = n2n_26_weight_28;
   meta.n2n_26_weight_29 = n2n_26_weight_29;
   meta.n2n_26_weight_30 = n2n_26_weight_30;
   meta.n2n_26_weight_31 = n2n_26_weight_31;
   meta.n2n_26_weight_32 = n2n_26_weight_32;
   meta.n2n_27_weight_1 = n2n_27_weight_1;
   meta.n2n_27_weight_2 = n2n_27_weight_2;
   meta.n2n_27_weight_3 = n2n_27_weight_3;
   meta.n2n_27_weight_4 = n2n_27_weight_4;
   meta.n2n_27_weight_5 = n2n_27_weight_5;
   meta.n2n_27_weight_6 = n2n_27_weight_6;
   meta.n2n_27_weight_7 = n2n_27_weight_7;
   meta.n2n_27_weight_8 = n2n_27_weight_8;
   meta.n2n_27_weight_9 = n2n_27_weight_9;
   meta.n2n_27_weight_10 = n2n_27_weight_10;
   meta.n2n_27_weight_11 = n2n_27_weight_11;
   meta.n2n_27_weight_12 = n2n_27_weight_12;
   meta.n2n_27_weight_13 = n2n_27_weight_13;
   meta.n2n_27_weight_14 = n2n_27_weight_14;
   meta.n2n_27_weight_15 = n2n_27_weight_15;
   meta.n2n_27_weight_16 = n2n_27_weight_16;
   meta.n2n_27_weight_17 = n2n_27_weight_17;
   meta.n2n_27_weight_18 = n2n_27_weight_18;
   meta.n2n_27_weight_19 = n2n_27_weight_19;
   meta.n2n_27_weight_20 = n2n_27_weight_20;
   meta.n2n_27_weight_21 = n2n_27_weight_21;
   meta.n2n_27_weight_22 = n2n_27_weight_22;
   meta.n2n_27_weight_23 = n2n_27_weight_23;
   meta.n2n_27_weight_24 = n2n_27_weight_24;
   meta.n2n_27_weight_25 = n2n_27_weight_25;
   meta.n2n_27_weight_26 = n2n_27_weight_26;
   meta.n2n_27_weight_27 = n2n_27_weight_27;
   meta.n2n_27_weight_28 = n2n_27_weight_28;
   meta.n2n_27_weight_29 = n2n_27_weight_29;
   meta.n2n_27_weight_30 = n2n_27_weight_30;
   meta.n2n_27_weight_31 = n2n_27_weight_31;
   meta.n2n_27_weight_32 = n2n_27_weight_32;
   meta.n2n_28_weight_1 = n2n_28_weight_1;
   meta.n2n_28_weight_2 = n2n_28_weight_2;
   meta.n2n_28_weight_3 = n2n_28_weight_3;
   meta.n2n_28_weight_4 = n2n_28_weight_4;
   meta.n2n_28_weight_5 = n2n_28_weight_5;
   meta.n2n_28_weight_6 = n2n_28_weight_6;
   meta.n2n_28_weight_7 = n2n_28_weight_7;
   meta.n2n_28_weight_8 = n2n_28_weight_8;
   meta.n2n_28_weight_9 = n2n_28_weight_9;
   meta.n2n_28_weight_10 = n2n_28_weight_10;
   meta.n2n_28_weight_11 = n2n_28_weight_11;
   meta.n2n_28_weight_12 = n2n_28_weight_12;
   meta.n2n_28_weight_13 = n2n_28_weight_13;
   meta.n2n_28_weight_14 = n2n_28_weight_14;
   meta.n2n_28_weight_15 = n2n_28_weight_15;
   meta.n2n_28_weight_16 = n2n_28_weight_16;
   meta.n2n_28_weight_17 = n2n_28_weight_17;
   meta.n2n_28_weight_18 = n2n_28_weight_18;
   meta.n2n_28_weight_19 = n2n_28_weight_19;
   meta.n2n_28_weight_20 = n2n_28_weight_20;
   meta.n2n_28_weight_21 = n2n_28_weight_21;
   meta.n2n_28_weight_22 = n2n_28_weight_22;
   meta.n2n_28_weight_23 = n2n_28_weight_23;
   meta.n2n_28_weight_24 = n2n_28_weight_24;
   meta.n2n_28_weight_25 = n2n_28_weight_25;
   meta.n2n_28_weight_26 = n2n_28_weight_26;
   meta.n2n_28_weight_27 = n2n_28_weight_27;
   meta.n2n_28_weight_28 = n2n_28_weight_28;
   meta.n2n_28_weight_29 = n2n_28_weight_29;
   meta.n2n_28_weight_30 = n2n_28_weight_30;
   meta.n2n_28_weight_31 = n2n_28_weight_31;
   meta.n2n_28_weight_32 = n2n_28_weight_32;
   meta.n2n_29_weight_1 = n2n_29_weight_1;
   meta.n2n_29_weight_2 = n2n_29_weight_2;
   meta.n2n_29_weight_3 = n2n_29_weight_3;
   meta.n2n_29_weight_4 = n2n_29_weight_4;
   meta.n2n_29_weight_5 = n2n_29_weight_5;
   meta.n2n_29_weight_6 = n2n_29_weight_6;
   meta.n2n_29_weight_7 = n2n_29_weight_7;
   meta.n2n_29_weight_8 = n2n_29_weight_8;
   meta.n2n_29_weight_9 = n2n_29_weight_9;
   meta.n2n_29_weight_10 = n2n_29_weight_10;
   meta.n2n_29_weight_11 = n2n_29_weight_11;
   meta.n2n_29_weight_12 = n2n_29_weight_12;
   meta.n2n_29_weight_13 = n2n_29_weight_13;
   meta.n2n_29_weight_14 = n2n_29_weight_14;
   meta.n2n_29_weight_15 = n2n_29_weight_15;
   meta.n2n_29_weight_16 = n2n_29_weight_16;
   meta.n2n_29_weight_17 = n2n_29_weight_17;
   meta.n2n_29_weight_18 = n2n_29_weight_18;
   meta.n2n_29_weight_19 = n2n_29_weight_19;
   meta.n2n_29_weight_20 = n2n_29_weight_20;
   meta.n2n_29_weight_21 = n2n_29_weight_21;
   meta.n2n_29_weight_22 = n2n_29_weight_22;
   meta.n2n_29_weight_23 = n2n_29_weight_23;
   meta.n2n_29_weight_24 = n2n_29_weight_24;
   meta.n2n_29_weight_25 = n2n_29_weight_25;
   meta.n2n_29_weight_26 = n2n_29_weight_26;
   meta.n2n_29_weight_27 = n2n_29_weight_27;
   meta.n2n_29_weight_28 = n2n_29_weight_28;
   meta.n2n_29_weight_29 = n2n_29_weight_29;
   meta.n2n_29_weight_30 = n2n_29_weight_30;
   meta.n2n_29_weight_31 = n2n_29_weight_31;
   meta.n2n_29_weight_32 = n2n_29_weight_32;
   meta.n2n_30_weight_1 = n2n_30_weight_1;
   meta.n2n_30_weight_2 = n2n_30_weight_2;
   meta.n2n_30_weight_3 = n2n_30_weight_3;
   meta.n2n_30_weight_4 = n2n_30_weight_4;
   meta.n2n_30_weight_5 = n2n_30_weight_5;
   meta.n2n_30_weight_6 = n2n_30_weight_6;
   meta.n2n_30_weight_7 = n2n_30_weight_7;
   meta.n2n_30_weight_8 = n2n_30_weight_8;
   meta.n2n_30_weight_9 = n2n_30_weight_9;
   meta.n2n_30_weight_10 = n2n_30_weight_10;
   meta.n2n_30_weight_11 = n2n_30_weight_11;
   meta.n2n_30_weight_12 = n2n_30_weight_12;
   meta.n2n_30_weight_13 = n2n_30_weight_13;
   meta.n2n_30_weight_14 = n2n_30_weight_14;
   meta.n2n_30_weight_15 = n2n_30_weight_15;
   meta.n2n_30_weight_16 = n2n_30_weight_16;
   meta.n2n_30_weight_17 = n2n_30_weight_17;
   meta.n2n_30_weight_18 = n2n_30_weight_18;
   meta.n2n_30_weight_19 = n2n_30_weight_19;
   meta.n2n_30_weight_20 = n2n_30_weight_20;
   meta.n2n_30_weight_21 = n2n_30_weight_21;
   meta.n2n_30_weight_22 = n2n_30_weight_22;
   meta.n2n_30_weight_23 = n2n_30_weight_23;
   meta.n2n_30_weight_24 = n2n_30_weight_24;
   meta.n2n_30_weight_25 = n2n_30_weight_25;
   meta.n2n_30_weight_26 = n2n_30_weight_26;
   meta.n2n_30_weight_27 = n2n_30_weight_27;
   meta.n2n_30_weight_28 = n2n_30_weight_28;
   meta.n2n_30_weight_29 = n2n_30_weight_29;
   meta.n2n_30_weight_30 = n2n_30_weight_30;
   meta.n2n_30_weight_31 = n2n_30_weight_31;
   meta.n2n_30_weight_32 = n2n_30_weight_32;
   meta.n2n_31_weight_1 = n2n_31_weight_1;
   meta.n2n_31_weight_2 = n2n_31_weight_2;
   meta.n2n_31_weight_3 = n2n_31_weight_3;
   meta.n2n_31_weight_4 = n2n_31_weight_4;
   meta.n2n_31_weight_5 = n2n_31_weight_5;
   meta.n2n_31_weight_6 = n2n_31_weight_6;
   meta.n2n_31_weight_7 = n2n_31_weight_7;
   meta.n2n_31_weight_8 = n2n_31_weight_8;
   meta.n2n_31_weight_9 = n2n_31_weight_9;
   meta.n2n_31_weight_10 = n2n_31_weight_10;
   meta.n2n_31_weight_11 = n2n_31_weight_11;
   meta.n2n_31_weight_12 = n2n_31_weight_12;
   meta.n2n_31_weight_13 = n2n_31_weight_13;
   meta.n2n_31_weight_14 = n2n_31_weight_14;
   meta.n2n_31_weight_15 = n2n_31_weight_15;
   meta.n2n_31_weight_16 = n2n_31_weight_16;
   meta.n2n_31_weight_17 = n2n_31_weight_17;
   meta.n2n_31_weight_18 = n2n_31_weight_18;
   meta.n2n_31_weight_19 = n2n_31_weight_19;
   meta.n2n_31_weight_20 = n2n_31_weight_20;
   meta.n2n_31_weight_21 = n2n_31_weight_21;
   meta.n2n_31_weight_22 = n2n_31_weight_22;
   meta.n2n_31_weight_23 = n2n_31_weight_23;
   meta.n2n_31_weight_24 = n2n_31_weight_24;
   meta.n2n_31_weight_25 = n2n_31_weight_25;
   meta.n2n_31_weight_26 = n2n_31_weight_26;
   meta.n2n_31_weight_27 = n2n_31_weight_27;
   meta.n2n_31_weight_28 = n2n_31_weight_28;
   meta.n2n_31_weight_29 = n2n_31_weight_29;
   meta.n2n_31_weight_30 = n2n_31_weight_30;
   meta.n2n_31_weight_31 = n2n_31_weight_31;
   meta.n2n_31_weight_32 = n2n_31_weight_32;
   meta.n2n_32_weight_1 = n2n_32_weight_1;
   meta.n2n_32_weight_2 = n2n_32_weight_2;
   meta.n2n_32_weight_3 = n2n_32_weight_3;
   meta.n2n_32_weight_4 = n2n_32_weight_4;
   meta.n2n_32_weight_5 = n2n_32_weight_5;
   meta.n2n_32_weight_6 = n2n_32_weight_6;
   meta.n2n_32_weight_7 = n2n_32_weight_7;
   meta.n2n_32_weight_8 = n2n_32_weight_8;
   meta.n2n_32_weight_9 = n2n_32_weight_9;
   meta.n2n_32_weight_10 = n2n_32_weight_10;
   meta.n2n_32_weight_11 = n2n_32_weight_11;
   meta.n2n_32_weight_12 = n2n_32_weight_12;
   meta.n2n_32_weight_13 = n2n_32_weight_13;
   meta.n2n_32_weight_14 = n2n_32_weight_14;
   meta.n2n_32_weight_15 = n2n_32_weight_15;
   meta.n2n_32_weight_16 = n2n_32_weight_16;
   meta.n2n_32_weight_17 = n2n_32_weight_17;
   meta.n2n_32_weight_18 = n2n_32_weight_18;
   meta.n2n_32_weight_19 = n2n_32_weight_19;
   meta.n2n_32_weight_20 = n2n_32_weight_20;
   meta.n2n_32_weight_21 = n2n_32_weight_21;
   meta.n2n_32_weight_22 = n2n_32_weight_22;
   meta.n2n_32_weight_23 = n2n_32_weight_23;
   meta.n2n_32_weight_24 = n2n_32_weight_24;
   meta.n2n_32_weight_25 = n2n_32_weight_25;
   meta.n2n_32_weight_26 = n2n_32_weight_26;
   meta.n2n_32_weight_27 = n2n_32_weight_27;
   meta.n2n_32_weight_28 = n2n_32_weight_28;
   meta.n2n_32_weight_29 = n2n_32_weight_29;
   meta.n2n_32_weight_30 = n2n_32_weight_30;
   meta.n2n_32_weight_31 = n2n_32_weight_31;
   meta.n2n_32_weight_32 = n2n_32_weight_32;
}

table tab_n2n_weight_32_to_32_neurons{
    key = {
        hdr.ann.neuron_id: exact;
    }
    actions = {
        set_n2n_weight_32_to_32_neurons;
    }
    size = 256;
}

action set_n2n_weight_32_to_3_neurons(bit<WORDSIZE> n2n_1_weight_1, bit<WORDSIZE> n2n_1_weight_2, bit<WORDSIZE> n2n_1_weight_3, bit<WORDSIZE> n2n_1_weight_4, bit<WORDSIZE> n2n_1_weight_5, bit<WORDSIZE> n2n_1_weight_6, bit<WORDSIZE> n2n_1_weight_7, bit<WORDSIZE> n2n_1_weight_8, bit<WORDSIZE> n2n_1_weight_9, bit<WORDSIZE> n2n_1_weight_10, bit<WORDSIZE> n2n_1_weight_11, bit<WORDSIZE> n2n_1_weight_12, bit<WORDSIZE> n2n_1_weight_13, bit<WORDSIZE> n2n_1_weight_14, bit<WORDSIZE> n2n_1_weight_15, bit<WORDSIZE> n2n_1_weight_16, bit<WORDSIZE> n2n_1_weight_17, bit<WORDSIZE> n2n_1_weight_18, bit<WORDSIZE> n2n_1_weight_19, bit<WORDSIZE> n2n_1_weight_20, bit<WORDSIZE> n2n_1_weight_21, bit<WORDSIZE> n2n_1_weight_22, bit<WORDSIZE> n2n_1_weight_23, bit<WORDSIZE> n2n_1_weight_24, bit<WORDSIZE> n2n_1_weight_25, bit<WORDSIZE> n2n_1_weight_26, bit<WORDSIZE> n2n_1_weight_27, bit<WORDSIZE> n2n_1_weight_28, bit<WORDSIZE> n2n_1_weight_29, bit<WORDSIZE> n2n_1_weight_30, bit<WORDSIZE> n2n_1_weight_31, bit<WORDSIZE> n2n_1_weight_32, bit<WORDSIZE> n2n_2_weight_1, bit<WORDSIZE> n2n_2_weight_2, bit<WORDSIZE> n2n_2_weight_3, bit<WORDSIZE> n2n_2_weight_4, bit<WORDSIZE> n2n_2_weight_5, bit<WORDSIZE> n2n_2_weight_6, bit<WORDSIZE> n2n_2_weight_7, bit<WORDSIZE> n2n_2_weight_8, bit<WORDSIZE> n2n_2_weight_9, bit<WORDSIZE> n2n_2_weight_10, bit<WORDSIZE> n2n_2_weight_11, bit<WORDSIZE> n2n_2_weight_12, bit<WORDSIZE> n2n_2_weight_13, bit<WORDSIZE> n2n_2_weight_14, bit<WORDSIZE> n2n_2_weight_15, bit<WORDSIZE> n2n_2_weight_16, bit<WORDSIZE> n2n_2_weight_17, bit<WORDSIZE> n2n_2_weight_18, bit<WORDSIZE> n2n_2_weight_19, bit<WORDSIZE> n2n_2_weight_20, bit<WORDSIZE> n2n_2_weight_21, bit<WORDSIZE> n2n_2_weight_22, bit<WORDSIZE> n2n_2_weight_23, bit<WORDSIZE> n2n_2_weight_24, bit<WORDSIZE> n2n_2_weight_25, bit<WORDSIZE> n2n_2_weight_26, bit<WORDSIZE> n2n_2_weight_27, bit<WORDSIZE> n2n_2_weight_28, bit<WORDSIZE> n2n_2_weight_29, bit<WORDSIZE> n2n_2_weight_30, bit<WORDSIZE> n2n_2_weight_31, bit<WORDSIZE> n2n_2_weight_32, bit<WORDSIZE> n2n_3_weight_1, bit<WORDSIZE> n2n_3_weight_2, bit<WORDSIZE> n2n_3_weight_3, bit<WORDSIZE> n2n_3_weight_4, bit<WORDSIZE> n2n_3_weight_5, bit<WORDSIZE> n2n_3_weight_6, bit<WORDSIZE> n2n_3_weight_7, bit<WORDSIZE> n2n_3_weight_8, bit<WORDSIZE> n2n_3_weight_9, bit<WORDSIZE> n2n_3_weight_10, bit<WORDSIZE> n2n_3_weight_11, bit<WORDSIZE> n2n_3_weight_12, bit<WORDSIZE> n2n_3_weight_13, bit<WORDSIZE> n2n_3_weight_14, bit<WORDSIZE> n2n_3_weight_15, bit<WORDSIZE> n2n_3_weight_16, bit<WORDSIZE> n2n_3_weight_17, bit<WORDSIZE> n2n_3_weight_18, bit<WORDSIZE> n2n_3_weight_19, bit<WORDSIZE> n2n_3_weight_20, bit<WORDSIZE> n2n_3_weight_21, bit<WORDSIZE> n2n_3_weight_22, bit<WORDSIZE> n2n_3_weight_23, bit<WORDSIZE> n2n_3_weight_24, bit<WORDSIZE> n2n_3_weight_25, bit<WORDSIZE> n2n_3_weight_26, bit<WORDSIZE> n2n_3_weight_27, bit<WORDSIZE> n2n_3_weight_28, bit<WORDSIZE> n2n_3_weight_29, bit<WORDSIZE> n2n_3_weight_30, bit<WORDSIZE> n2n_3_weight_31, bit<WORDSIZE> n2n_3_weight_32){
   meta.n2n_1_weight_1 = n2n_1_weight_1;
   meta.n2n_1_weight_2 = n2n_1_weight_2;
   meta.n2n_1_weight_3 = n2n_1_weight_3;
   meta.n2n_1_weight_4 = n2n_1_weight_4;
   meta.n2n_1_weight_5 = n2n_1_weight_5;
   meta.n2n_1_weight_6 = n2n_1_weight_6;
   meta.n2n_1_weight_7 = n2n_1_weight_7;
   meta.n2n_1_weight_8 = n2n_1_weight_8;
   meta.n2n_1_weight_9 = n2n_1_weight_9;
   meta.n2n_1_weight_10 = n2n_1_weight_10;
   meta.n2n_1_weight_11 = n2n_1_weight_11;
   meta.n2n_1_weight_12 = n2n_1_weight_12;
   meta.n2n_1_weight_13 = n2n_1_weight_13;
   meta.n2n_1_weight_14 = n2n_1_weight_14;
   meta.n2n_1_weight_15 = n2n_1_weight_15;
   meta.n2n_1_weight_16 = n2n_1_weight_16;
   meta.n2n_1_weight_17 = n2n_1_weight_17;
   meta.n2n_1_weight_18 = n2n_1_weight_18;
   meta.n2n_1_weight_19 = n2n_1_weight_19;
   meta.n2n_1_weight_20 = n2n_1_weight_20;
   meta.n2n_1_weight_21 = n2n_1_weight_21;
   meta.n2n_1_weight_22 = n2n_1_weight_22;
   meta.n2n_1_weight_23 = n2n_1_weight_23;
   meta.n2n_1_weight_24 = n2n_1_weight_24;
   meta.n2n_1_weight_25 = n2n_1_weight_25;
   meta.n2n_1_weight_26 = n2n_1_weight_26;
   meta.n2n_1_weight_27 = n2n_1_weight_27;
   meta.n2n_1_weight_28 = n2n_1_weight_28;
   meta.n2n_1_weight_29 = n2n_1_weight_29;
   meta.n2n_1_weight_30 = n2n_1_weight_30;
   meta.n2n_1_weight_31 = n2n_1_weight_31;
   meta.n2n_1_weight_32 = n2n_1_weight_32;
   meta.n2n_2_weight_1 = n2n_2_weight_1;
   meta.n2n_2_weight_2 = n2n_2_weight_2;
   meta.n2n_2_weight_3 = n2n_2_weight_3;
   meta.n2n_2_weight_4 = n2n_2_weight_4;
   meta.n2n_2_weight_5 = n2n_2_weight_5;
   meta.n2n_2_weight_6 = n2n_2_weight_6;
   meta.n2n_2_weight_7 = n2n_2_weight_7;
   meta.n2n_2_weight_8 = n2n_2_weight_8;
   meta.n2n_2_weight_9 = n2n_2_weight_9;
   meta.n2n_2_weight_10 = n2n_2_weight_10;
   meta.n2n_2_weight_11 = n2n_2_weight_11;
   meta.n2n_2_weight_12 = n2n_2_weight_12;
   meta.n2n_2_weight_13 = n2n_2_weight_13;
   meta.n2n_2_weight_14 = n2n_2_weight_14;
   meta.n2n_2_weight_15 = n2n_2_weight_15;
   meta.n2n_2_weight_16 = n2n_2_weight_16;
   meta.n2n_2_weight_17 = n2n_2_weight_17;
   meta.n2n_2_weight_18 = n2n_2_weight_18;
   meta.n2n_2_weight_19 = n2n_2_weight_19;
   meta.n2n_2_weight_20 = n2n_2_weight_20;
   meta.n2n_2_weight_21 = n2n_2_weight_21;
   meta.n2n_2_weight_22 = n2n_2_weight_22;
   meta.n2n_2_weight_23 = n2n_2_weight_23;
   meta.n2n_2_weight_24 = n2n_2_weight_24;
   meta.n2n_2_weight_25 = n2n_2_weight_25;
   meta.n2n_2_weight_26 = n2n_2_weight_26;
   meta.n2n_2_weight_27 = n2n_2_weight_27;
   meta.n2n_2_weight_28 = n2n_2_weight_28;
   meta.n2n_2_weight_29 = n2n_2_weight_29;
   meta.n2n_2_weight_30 = n2n_2_weight_30;
   meta.n2n_2_weight_31 = n2n_2_weight_31;
   meta.n2n_2_weight_32 = n2n_2_weight_32;
   meta.n2n_3_weight_1 = n2n_3_weight_1;
   meta.n2n_3_weight_2 = n2n_3_weight_2;
   meta.n2n_3_weight_3 = n2n_3_weight_3;
   meta.n2n_3_weight_4 = n2n_3_weight_4;
   meta.n2n_3_weight_5 = n2n_3_weight_5;
   meta.n2n_3_weight_6 = n2n_3_weight_6;
   meta.n2n_3_weight_7 = n2n_3_weight_7;
   meta.n2n_3_weight_8 = n2n_3_weight_8;
   meta.n2n_3_weight_9 = n2n_3_weight_9;
   meta.n2n_3_weight_10 = n2n_3_weight_10;
   meta.n2n_3_weight_11 = n2n_3_weight_11;
   meta.n2n_3_weight_12 = n2n_3_weight_12;
   meta.n2n_3_weight_13 = n2n_3_weight_13;
   meta.n2n_3_weight_14 = n2n_3_weight_14;
   meta.n2n_3_weight_15 = n2n_3_weight_15;
   meta.n2n_3_weight_16 = n2n_3_weight_16;
   meta.n2n_3_weight_17 = n2n_3_weight_17;
   meta.n2n_3_weight_18 = n2n_3_weight_18;
   meta.n2n_3_weight_19 = n2n_3_weight_19;
   meta.n2n_3_weight_20 = n2n_3_weight_20;
   meta.n2n_3_weight_21 = n2n_3_weight_21;
   meta.n2n_3_weight_22 = n2n_3_weight_22;
   meta.n2n_3_weight_23 = n2n_3_weight_23;
   meta.n2n_3_weight_24 = n2n_3_weight_24;
   meta.n2n_3_weight_25 = n2n_3_weight_25;
   meta.n2n_3_weight_26 = n2n_3_weight_26;
   meta.n2n_3_weight_27 = n2n_3_weight_27;
   meta.n2n_3_weight_28 = n2n_3_weight_28;
   meta.n2n_3_weight_29 = n2n_3_weight_29;
   meta.n2n_3_weight_30 = n2n_3_weight_30;
   meta.n2n_3_weight_31 = n2n_3_weight_31;
   meta.n2n_3_weight_32 = n2n_3_weight_32;
}

table tab_n2n_weight_32_to_3_neurons{
    key = {
        hdr.ann.neuron_id: exact;
    }
    actions = {
        set_n2n_weight_32_to_3_neurons;
    }
    size = 256;
}

action set_norm_mean_std(bit<WORDSIZE> neuron_1_mean, bit<WORDSIZE> neuron_1_std, bit<WORDSIZE> neuron_2_mean, bit<WORDSIZE> neuron_2_std, bit<WORDSIZE> neuron_3_mean, bit<WORDSIZE> neuron_3_std, bit<WORDSIZE> neuron_4_mean, bit<WORDSIZE> neuron_4_std, bit<WORDSIZE> neuron_5_mean, bit<WORDSIZE> neuron_5_std, bit<WORDSIZE> neuron_6_mean, bit<WORDSIZE> neuron_6_std, bit<WORDSIZE> neuron_7_mean, bit<WORDSIZE> neuron_7_std, bit<WORDSIZE> neuron_8_mean, bit<WORDSIZE> neuron_8_std, bit<WORDSIZE> neuron_9_mean, bit<WORDSIZE> neuron_9_std, bit<WORDSIZE> neuron_10_mean, bit<WORDSIZE> neuron_10_std, bit<WORDSIZE> neuron_11_mean, bit<WORDSIZE> neuron_11_std, bit<WORDSIZE> neuron_12_mean, bit<WORDSIZE> neuron_12_std, bit<WORDSIZE> neuron_13_mean, bit<WORDSIZE> neuron_13_std, bit<WORDSIZE> neuron_14_mean, bit<WORDSIZE> neuron_14_std, bit<WORDSIZE> neuron_15_mean, bit<WORDSIZE> neuron_15_std, bit<WORDSIZE> neuron_16_mean, bit<WORDSIZE> neuron_16_std, bit<WORDSIZE> neuron_17_mean, bit<WORDSIZE> neuron_17_std, bit<WORDSIZE> neuron_18_mean, bit<WORDSIZE> neuron_18_std, bit<WORDSIZE> neuron_19_mean, bit<WORDSIZE> neuron_19_std, bit<WORDSIZE> neuron_20_mean, bit<WORDSIZE> neuron_20_std, bit<WORDSIZE> neuron_21_mean, bit<WORDSIZE> neuron_21_std, bit<WORDSIZE> neuron_22_mean, bit<WORDSIZE> neuron_22_std, bit<WORDSIZE> neuron_23_mean, bit<WORDSIZE> neuron_23_std, bit<WORDSIZE> neuron_24_mean, bit<WORDSIZE> neuron_24_std, bit<WORDSIZE> neuron_25_mean, bit<WORDSIZE> neuron_25_std, bit<WORDSIZE> neuron_26_mean, bit<WORDSIZE> neuron_26_std, bit<WORDSIZE> neuron_27_mean, bit<WORDSIZE> neuron_27_std, bit<WORDSIZE> neuron_28_mean, bit<WORDSIZE> neuron_28_std, bit<WORDSIZE> neuron_29_mean, bit<WORDSIZE> neuron_29_std, bit<WORDSIZE> neuron_30_mean, bit<WORDSIZE> neuron_30_std, bit<WORDSIZE> neuron_31_mean, bit<WORDSIZE> neuron_31_std, bit<WORDSIZE> neuron_32_mean, bit<WORDSIZE> neuron_32_std){
   meta.neuron_1_mean = neuron_1_mean;
   meta.neuron_1_std = neuron_1_std;
   meta.neuron_2_mean = neuron_2_mean;
   meta.neuron_2_std = neuron_2_std;
   meta.neuron_3_mean = neuron_3_mean;
   meta.neuron_3_std = neuron_3_std;
   meta.neuron_4_mean = neuron_4_mean;
   meta.neuron_4_std = neuron_4_std;
   meta.neuron_5_mean = neuron_5_mean;
   meta.neuron_5_std = neuron_5_std;
   meta.neuron_6_mean = neuron_6_mean;
   meta.neuron_6_std = neuron_6_std;
   meta.neuron_7_mean = neuron_7_mean;
   meta.neuron_7_std = neuron_7_std;
   meta.neuron_8_mean = neuron_8_mean;
   meta.neuron_8_std = neuron_8_std;
   meta.neuron_9_mean = neuron_9_mean;
   meta.neuron_9_std = neuron_9_std;
   meta.neuron_10_mean = neuron_10_mean;
   meta.neuron_10_std = neuron_10_std;
   meta.neuron_11_mean = neuron_11_mean;
   meta.neuron_11_std = neuron_11_std;
   meta.neuron_12_mean = neuron_12_mean;
   meta.neuron_12_std = neuron_12_std;
   meta.neuron_13_mean = neuron_13_mean;
   meta.neuron_13_std = neuron_13_std;
   meta.neuron_14_mean = neuron_14_mean;
   meta.neuron_14_std = neuron_14_std;
   meta.neuron_15_mean = neuron_15_mean;
   meta.neuron_15_std = neuron_15_std;
   meta.neuron_16_mean = neuron_16_mean;
   meta.neuron_16_std = neuron_16_std;
   meta.neuron_17_mean = neuron_17_mean;
   meta.neuron_17_std = neuron_17_std;
   meta.neuron_18_mean = neuron_18_mean;
   meta.neuron_18_std = neuron_18_std;
   meta.neuron_19_mean = neuron_19_mean;
   meta.neuron_19_std = neuron_19_std;
   meta.neuron_20_mean = neuron_20_mean;
   meta.neuron_20_std = neuron_20_std;
   meta.neuron_21_mean = neuron_21_mean;
   meta.neuron_21_std = neuron_21_std;
   meta.neuron_22_mean = neuron_22_mean;
   meta.neuron_22_std = neuron_22_std;
   meta.neuron_23_mean = neuron_23_mean;
   meta.neuron_23_std = neuron_23_std;
   meta.neuron_24_mean = neuron_24_mean;
   meta.neuron_24_std = neuron_24_std;
   meta.neuron_25_mean = neuron_25_mean;
   meta.neuron_25_std = neuron_25_std;
   meta.neuron_26_mean = neuron_26_mean;
   meta.neuron_26_std = neuron_26_std;
   meta.neuron_27_mean = neuron_27_mean;
   meta.neuron_27_std = neuron_27_std;
   meta.neuron_28_mean = neuron_28_mean;
   meta.neuron_28_std = neuron_28_std;
   meta.neuron_29_mean = neuron_29_mean;
   meta.neuron_29_std = neuron_29_std;
   meta.neuron_30_mean = neuron_30_mean;
   meta.neuron_30_std = neuron_30_std;
   meta.neuron_31_mean = neuron_31_mean;
   meta.neuron_31_std = neuron_31_std;
   meta.neuron_32_mean = neuron_32_mean;
   meta.neuron_32_std = neuron_32_std;

}

table tab_norm_mean_std{
    actions = {
        set_norm_mean_std;
    }
    size = 1;
}

action set_activation_func(bit<32> activation_func){
    meta.activation_func = activation_func;
}

table tab_activation_func{
    actions = {
        set_activation_func;
    }
    size = 1;
}

apply {
    if(hdr.ann.isValid()){                                   // If the ANN header is present in the packet
        reg_run_id.read(meta.run_id, 0);
        if(hdr.ann.run_id != meta.run_id){                   // If the run_id in the receiving differs from the stored run_id, reset the received stimuli so we don't mix up data
            reg_run_id.write(0, hdr.ann.run_id);
            reg_received_stimuli.write(0, 0);
            reg_n_received_stimuli.write(0, 0);
        }
        tab_expected_stimuli.apply();                         // Get the bitstring of expected stimuli and store in the MD field
        reg_received_stimuli.read(meta.received_stimuli, 0);  // Get the bitstring of received stimuli and store in the MD field

        // Declare and compute the value of a variable that indicates whether the stimulus in the packet is expected
        bit<128> expected = meta.expected_stimuli & ((bit<128>) 1 << (bit<8>) hdr.ann.neuron_id); // the bit shift and & operator enable us to do the checking.
        // Declare and compute the value of a variable that indicates whether the stimulus in the packet has been received
        bit<128> received = meta.received_stimuli & ((bit<128>) 1 << (bit<8>) hdr.ann.neuron_id);

        // Check if the stimulus is expected and was not yet received
        if((expected > (bit<128>) 0) && (received == (bit<128>) 0)){
            meta.received_stimuli = meta.received_stimuli | ((bit<128>) 1 << (bit<8>) hdr.ann.neuron_id);
            reg_received_stimuli.write(0, meta.received_stimuli);
            // Load n_received_stimuli from register, increment it, and write back
            reg_n_received_stimuli.read(meta.n_received_stimuli, 0);
            meta.n_received_stimuli = meta.n_received_stimuli + 1;
            reg_n_received_stimuli.write(0, meta.n_received_stimuli);
            // Set the register(s) storing the neuron aggregation and bias function
            tab_agg_func.apply();
            tab_neuron_bias_32_neurons.apply();
            tab_neuron_bias_3_neurons.apply();
            //Calculate the aggregation funciton

            if(meta.agg_func == FUNC_NORMALIZATION){
                // normalized_value = (raw_value - weight) / sqrt(biases)
                // since there's no subtraction nor division in P4, must adequate the formula to
                // normalized_value = (raw_value + (-weight) * (sqrt(bias)) ** -1

                // A NOTE ON SIGN EXTENSION: When we extend the number of bits of a negative number, we must also extend the signal to keep the correctness.
                // Example	-Corect: positive, no need for sign extension	w: 0001 -> dw: 0000 0001
                //			-Corect: negative, with sign extension 			w: 1110 -> dw: 1111 1110
                //			-WRONG:  negative, without sign extension 		w: 1110 -> dw: 0000 1110

                tab_norm_mean_std.apply(); // Load weight (mean) and bias (std)

                // Neuron 1:
                bit<WORDSIZE> operand_a1 = hdr.ann.data_1 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b1 = meta.neuron_1_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_1 = operand_a1 + operand_b1; // Compute the sum
                bit<D_WORDSIZE> sum_result_1_dw = (bit<D_WORDSIZE>) sum_result_1; // Need to double the wordsize to store the multiplication result
                if((sum_result_1_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_1_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_1_dw;
                }
                bit<D_WORDSIZE> operand_c1 = (bit<D_WORDSIZE>) meta.neuron_1_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c1 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c1;
                }
                bit<D_WORDSIZE> norm_result_1 = ((sum_result_1_dw * operand_c1) >> PRECISION);
                meta.neuron_1_data = (bit<WORDSIZE>) norm_result_1; // Resize the data to wordsize to be fowarded
                reg_neuron_1_data.write(0, meta.neuron_1_data);  // Store the value to be fowarded

                // Neuron 2:
                bit<WORDSIZE> operand_a2 = hdr.ann.data_2 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b2 = meta.neuron_2_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_2 = operand_a2 + operand_b2; // Compute the sum
                bit<D_WORDSIZE> sum_result_2_dw = (bit<D_WORDSIZE>) sum_result_2; // Need to double the wordsize to store the multiplication result
                if((sum_result_2_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_2_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_2_dw;
                }
                bit<D_WORDSIZE> operand_c2 = (bit<D_WORDSIZE>) meta.neuron_2_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c2 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c2;
                }
                bit<D_WORDSIZE> norm_result_2 = ((sum_result_2_dw * operand_c2) >> PRECISION);
                meta.neuron_2_data = (bit<WORDSIZE>) norm_result_2; // Resize the data to wordsize to be fowarded
                reg_neuron_2_data.write(0, meta.neuron_2_data);  // Store the value to be fowarded

                // Neuron 3:
                bit<WORDSIZE> operand_a3 = hdr.ann.data_3 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b3 = meta.neuron_3_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_3 = operand_a3 + operand_b3; // Compute the sum
                bit<D_WORDSIZE> sum_result_3_dw = (bit<D_WORDSIZE>) sum_result_3; // Need to double the wordsize to store the multiplication result
                if((sum_result_3_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_3_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_3_dw;
                }
                bit<D_WORDSIZE> operand_c3 = (bit<D_WORDSIZE>) meta.neuron_3_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c3 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c3;
                }
                bit<D_WORDSIZE> norm_result_3 = ((sum_result_3_dw * operand_c3) >> PRECISION);
                meta.neuron_3_data = (bit<WORDSIZE>) norm_result_3; // Resize the data to wordsize to be fowarded
                reg_neuron_3_data.write(0, meta.neuron_3_data);  // Store the value to be fowarded

                // Neuron 4:
                bit<WORDSIZE> operand_a4 = hdr.ann.data_4 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b4 = meta.neuron_4_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_4 = operand_a4 + operand_b4; // Compute the sum
                bit<D_WORDSIZE> sum_result_4_dw = (bit<D_WORDSIZE>) sum_result_4; // Need to double the wordsize to store the multiplication result
                if((sum_result_4_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_4_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_4_dw;
                }
                bit<D_WORDSIZE> operand_c4 = (bit<D_WORDSIZE>) meta.neuron_4_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c4 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c4;
                }
                bit<D_WORDSIZE> norm_result_4 = ((sum_result_4_dw * operand_c4) >> PRECISION);
                meta.neuron_4_data = (bit<WORDSIZE>) norm_result_4; // Resize the data to wordsize to be fowarded
                reg_neuron_4_data.write(0, meta.neuron_4_data);  // Store the value to be fowarded

                // Neuron 5:
                bit<WORDSIZE> operand_a5 = hdr.ann.data_5 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b5 = meta.neuron_5_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_5 = operand_a5 + operand_b5; // Compute the sum
                bit<D_WORDSIZE> sum_result_5_dw = (bit<D_WORDSIZE>) sum_result_5; // Need to double the wordsize to store the multiplication result
                if((sum_result_5_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_5_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_5_dw;
                }
                bit<D_WORDSIZE> operand_c5 = (bit<D_WORDSIZE>) meta.neuron_5_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c5 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c5;
                }
                bit<D_WORDSIZE> norm_result_5 = ((sum_result_5_dw * operand_c5) >> PRECISION);
                meta.neuron_5_data = (bit<WORDSIZE>) norm_result_5; // Resize the data to wordsize to be fowarded
                reg_neuron_5_data.write(0, meta.neuron_5_data);  // Store the value to be fowarded

                // Neuron 6:
                bit<WORDSIZE> operand_a6 = hdr.ann.data_6 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b6 = meta.neuron_6_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_6 = operand_a6 + operand_b6; // Compute the sum
                bit<D_WORDSIZE> sum_result_6_dw = (bit<D_WORDSIZE>) sum_result_6; // Need to double the wordsize to store the multiplication result
                if((sum_result_6_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_6_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_6_dw;
                }
                bit<D_WORDSIZE> operand_c6 = (bit<D_WORDSIZE>) meta.neuron_6_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c6 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c6;
                }
                bit<D_WORDSIZE> norm_result_6 = ((sum_result_6_dw * operand_c6) >> PRECISION);
                meta.neuron_6_data = (bit<WORDSIZE>) norm_result_6; // Resize the data to wordsize to be fowarded
                reg_neuron_6_data.write(0, meta.neuron_6_data);  // Store the value to be fowarded

                // Neuron 7:
                bit<WORDSIZE> operand_a7 = hdr.ann.data_7 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b7 = meta.neuron_7_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_7 = operand_a7 + operand_b7; // Compute the sum
                bit<D_WORDSIZE> sum_result_7_dw = (bit<D_WORDSIZE>) sum_result_7; // Need to double the wordsize to store the multiplication result
                if((sum_result_7_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_7_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_7_dw;
                }
                bit<D_WORDSIZE> operand_c7 = (bit<D_WORDSIZE>) meta.neuron_7_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c7 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c7;
                }
                bit<D_WORDSIZE> norm_result_7 = ((sum_result_7_dw * operand_c7) >> PRECISION);
                meta.neuron_7_data = (bit<WORDSIZE>) norm_result_7; // Resize the data to wordsize to be fowarded
                reg_neuron_7_data.write(0, meta.neuron_7_data);  // Store the value to be fowarded

                // Neuron 8:
                bit<WORDSIZE> operand_a8 = hdr.ann.data_8 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b8 = meta.neuron_8_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_8 = operand_a8 + operand_b8; // Compute the sum
                bit<D_WORDSIZE> sum_result_8_dw = (bit<D_WORDSIZE>) sum_result_8; // Need to double the wordsize to store the multiplication result
                if((sum_result_8_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_8_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_8_dw;
                }
                bit<D_WORDSIZE> operand_c8 = (bit<D_WORDSIZE>) meta.neuron_8_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c8 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c8;
                }
                bit<D_WORDSIZE> norm_result_8 = ((sum_result_8_dw * operand_c8) >> PRECISION);
                meta.neuron_8_data = (bit<WORDSIZE>) norm_result_8; // Resize the data to wordsize to be fowarded
                reg_neuron_8_data.write(0, meta.neuron_8_data);  // Store the value to be fowarded

                // Neuron 9:
                bit<WORDSIZE> operand_a9 = hdr.ann.data_9 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b9 = meta.neuron_9_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_9 = operand_a9 + operand_b9; // Compute the sum
                bit<D_WORDSIZE> sum_result_9_dw = (bit<D_WORDSIZE>) sum_result_9; // Need to double the wordsize to store the multiplication result
                if((sum_result_9_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_9_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_9_dw;
                }
                bit<D_WORDSIZE> operand_c9 = (bit<D_WORDSIZE>) meta.neuron_9_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c9 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c9;
                }
                bit<D_WORDSIZE> norm_result_9 = ((sum_result_9_dw * operand_c9) >> PRECISION);
                meta.neuron_9_data = (bit<WORDSIZE>) norm_result_9; // Resize the data to wordsize to be fowarded
                reg_neuron_9_data.write(0, meta.neuron_9_data);  // Store the value to be fowarded

                // Neuron 10:
                bit<WORDSIZE> operand_a10 = hdr.ann.data_10 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b10 = meta.neuron_10_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_10 = operand_a10 + operand_b10; // Compute the sum
                bit<D_WORDSIZE> sum_result_10_dw = (bit<D_WORDSIZE>) sum_result_10; // Need to double the wordsize to store the multiplication result
                if((sum_result_10_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_10_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_10_dw;
                }
                bit<D_WORDSIZE> operand_c10 = (bit<D_WORDSIZE>) meta.neuron_10_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c10 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c10;
                }
                bit<D_WORDSIZE> norm_result_10 = ((sum_result_10_dw * operand_c10) >> PRECISION);
                meta.neuron_10_data = (bit<WORDSIZE>) norm_result_10; // Resize the data to wordsize to be fowarded
                reg_neuron_10_data.write(0, meta.neuron_10_data);  // Store the value to be fowarded

                // Neuron 11:
                bit<WORDSIZE> operand_a11 = hdr.ann.data_11 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b11 = meta.neuron_11_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_11 = operand_a11 + operand_b11; // Compute the sum
                bit<D_WORDSIZE> sum_result_11_dw = (bit<D_WORDSIZE>) sum_result_11; // Need to double the wordsize to store the multiplication result
                if((sum_result_11_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_11_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_11_dw;
                }
                bit<D_WORDSIZE> operand_c11 = (bit<D_WORDSIZE>) meta.neuron_11_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c11 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c11;
                }
                bit<D_WORDSIZE> norm_result_11 = ((sum_result_11_dw * operand_c11) >> PRECISION);
                meta.neuron_11_data = (bit<WORDSIZE>) norm_result_11; // Resize the data to wordsize to be fowarded
                reg_neuron_11_data.write(0, meta.neuron_11_data);  // Store the value to be fowarded

                // Neuron 12:
                bit<WORDSIZE> operand_a12 = hdr.ann.data_12 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b12 = meta.neuron_12_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_12 = operand_a12 + operand_b12; // Compute the sum
                bit<D_WORDSIZE> sum_result_12_dw = (bit<D_WORDSIZE>) sum_result_12; // Need to double the wordsize to store the multiplication result
                if((sum_result_12_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_12_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_12_dw;
                }
                bit<D_WORDSIZE> operand_c12 = (bit<D_WORDSIZE>) meta.neuron_12_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c12 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c12;
                }
                bit<D_WORDSIZE> norm_result_12 = ((sum_result_12_dw * operand_c12) >> PRECISION);
                meta.neuron_12_data = (bit<WORDSIZE>) norm_result_12; // Resize the data to wordsize to be fowarded
                reg_neuron_12_data.write(0, meta.neuron_12_data);  // Store the value to be fowarded

                // Neuron 13:
                bit<WORDSIZE> operand_a13 = hdr.ann.data_13 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b13 = meta.neuron_13_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_13 = operand_a13 + operand_b13; // Compute the sum
                bit<D_WORDSIZE> sum_result_13_dw = (bit<D_WORDSIZE>) sum_result_13; // Need to double the wordsize to store the multiplication result
                if((sum_result_13_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_13_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_13_dw;
                }
                bit<D_WORDSIZE> operand_c13 = (bit<D_WORDSIZE>) meta.neuron_13_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c13 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c13;
                }
                bit<D_WORDSIZE> norm_result_13 = ((sum_result_13_dw * operand_c13) >> PRECISION);
                meta.neuron_13_data = (bit<WORDSIZE>) norm_result_13; // Resize the data to wordsize to be fowarded
                reg_neuron_13_data.write(0, meta.neuron_13_data);  // Store the value to be fowarded

                // Neuron 14:
                bit<WORDSIZE> operand_a14 = hdr.ann.data_14 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b14 = meta.neuron_14_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_14 = operand_a14 + operand_b14; // Compute the sum
                bit<D_WORDSIZE> sum_result_14_dw = (bit<D_WORDSIZE>) sum_result_14; // Need to double the wordsize to store the multiplication result
                if((sum_result_14_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_14_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_14_dw;
                }
                bit<D_WORDSIZE> operand_c14 = (bit<D_WORDSIZE>) meta.neuron_14_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c14 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c14;
                }
                bit<D_WORDSIZE> norm_result_14 = ((sum_result_14_dw * operand_c14) >> PRECISION);
                meta.neuron_14_data = (bit<WORDSIZE>) norm_result_14; // Resize the data to wordsize to be fowarded
                reg_neuron_14_data.write(0, meta.neuron_14_data);  // Store the value to be fowarded

                // Neuron 15:
                bit<WORDSIZE> operand_a15 = hdr.ann.data_15 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b15 = meta.neuron_15_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_15 = operand_a15 + operand_b15; // Compute the sum
                bit<D_WORDSIZE> sum_result_15_dw = (bit<D_WORDSIZE>) sum_result_15; // Need to double the wordsize to store the multiplication result
                if((sum_result_15_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_15_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_15_dw;
                }
                bit<D_WORDSIZE> operand_c15 = (bit<D_WORDSIZE>) meta.neuron_15_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c15 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c15;
                }
                bit<D_WORDSIZE> norm_result_15 = ((sum_result_15_dw * operand_c15) >> PRECISION);
                meta.neuron_15_data = (bit<WORDSIZE>) norm_result_15; // Resize the data to wordsize to be fowarded
                reg_neuron_15_data.write(0, meta.neuron_15_data);  // Store the value to be fowarded

                // Neuron 16:
                bit<WORDSIZE> operand_a16 = hdr.ann.data_16 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b16 = meta.neuron_16_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_16 = operand_a16 + operand_b16; // Compute the sum
                bit<D_WORDSIZE> sum_result_16_dw = (bit<D_WORDSIZE>) sum_result_16; // Need to double the wordsize to store the multiplication result
                if((sum_result_16_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_16_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_16_dw;
                }
                bit<D_WORDSIZE> operand_c16 = (bit<D_WORDSIZE>) meta.neuron_16_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c16 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c16;
                }
                bit<D_WORDSIZE> norm_result_16 = ((sum_result_16_dw * operand_c16) >> PRECISION);
                meta.neuron_16_data = (bit<WORDSIZE>) norm_result_16; // Resize the data to wordsize to be fowarded
                reg_neuron_16_data.write(0, meta.neuron_16_data);  // Store the value to be fowarded

                // Neuron 17:
                bit<WORDSIZE> operand_a17 = hdr.ann.data_17 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b17 = meta.neuron_17_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_17 = operand_a17 + operand_b17; // Compute the sum
                bit<D_WORDSIZE> sum_result_17_dw = (bit<D_WORDSIZE>) sum_result_17; // Need to double the wordsize to store the multiplication result
                if((sum_result_17_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_17_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_17_dw;
                }
                bit<D_WORDSIZE> operand_c17 = (bit<D_WORDSIZE>) meta.neuron_17_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c17 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c17;
                }
                bit<D_WORDSIZE> norm_result_17 = ((sum_result_17_dw * operand_c17) >> PRECISION);
                meta.neuron_17_data = (bit<WORDSIZE>) norm_result_17; // Resize the data to wordsize to be fowarded
                reg_neuron_17_data.write(0, meta.neuron_17_data);  // Store the value to be fowarded

                // Neuron 18:
                bit<WORDSIZE> operand_a18 = hdr.ann.data_18 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b18 = meta.neuron_18_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_18 = operand_a18 + operand_b18; // Compute the sum
                bit<D_WORDSIZE> sum_result_18_dw = (bit<D_WORDSIZE>) sum_result_18; // Need to double the wordsize to store the multiplication result
                if((sum_result_18_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_18_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_18_dw;
                }
                bit<D_WORDSIZE> operand_c18 = (bit<D_WORDSIZE>) meta.neuron_18_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c18 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c18;
                }
                bit<D_WORDSIZE> norm_result_18 = ((sum_result_18_dw * operand_c18) >> PRECISION);
                meta.neuron_18_data = (bit<WORDSIZE>) norm_result_18; // Resize the data to wordsize to be fowarded
                reg_neuron_18_data.write(0, meta.neuron_18_data);  // Store the value to be fowarded

                // Neuron 19:
                bit<WORDSIZE> operand_a19 = hdr.ann.data_19 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b19 = meta.neuron_19_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_19 = operand_a19 + operand_b19; // Compute the sum
                bit<D_WORDSIZE> sum_result_19_dw = (bit<D_WORDSIZE>) sum_result_19; // Need to double the wordsize to store the multiplication result
                if((sum_result_19_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_19_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_19_dw;
                }
                bit<D_WORDSIZE> operand_c19 = (bit<D_WORDSIZE>) meta.neuron_19_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c19 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c19;
                }
                bit<D_WORDSIZE> norm_result_19 = ((sum_result_19_dw * operand_c19) >> PRECISION);
                meta.neuron_19_data = (bit<WORDSIZE>) norm_result_19; // Resize the data to wordsize to be fowarded
                reg_neuron_19_data.write(0, meta.neuron_19_data);  // Store the value to be fowarded

                // Neuron 20:
                bit<WORDSIZE> operand_a20 = hdr.ann.data_20 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b20 = meta.neuron_20_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_20 = operand_a20 + operand_b20; // Compute the sum
                bit<D_WORDSIZE> sum_result_20_dw = (bit<D_WORDSIZE>) sum_result_20; // Need to double the wordsize to store the multiplication result
                if((sum_result_20_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_20_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_20_dw;
                }
                bit<D_WORDSIZE> operand_c20 = (bit<D_WORDSIZE>) meta.neuron_20_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c20 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c20;
                }
                bit<D_WORDSIZE> norm_result_20 = ((sum_result_20_dw * operand_c20) >> PRECISION);
                meta.neuron_20_data = (bit<WORDSIZE>) norm_result_20; // Resize the data to wordsize to be fowarded
                reg_neuron_20_data.write(0, meta.neuron_20_data);  // Store the value to be fowarded

                // Neuron 21:
                bit<WORDSIZE> operand_a21 = hdr.ann.data_21 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b21 = meta.neuron_21_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_21 = operand_a21 + operand_b21; // Compute the sum
                bit<D_WORDSIZE> sum_result_21_dw = (bit<D_WORDSIZE>) sum_result_21; // Need to double the wordsize to store the multiplication result
                if((sum_result_21_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_21_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_21_dw;
                }
                bit<D_WORDSIZE> operand_c21 = (bit<D_WORDSIZE>) meta.neuron_21_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c21 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c21;
                }
                bit<D_WORDSIZE> norm_result_21 = ((sum_result_21_dw * operand_c21) >> PRECISION);
                meta.neuron_21_data = (bit<WORDSIZE>) norm_result_21; // Resize the data to wordsize to be fowarded
                reg_neuron_21_data.write(0, meta.neuron_21_data);  // Store the value to be fowarded

                // Neuron 22:
                bit<WORDSIZE> operand_a22 = hdr.ann.data_22 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b22 = meta.neuron_22_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_22 = operand_a22 + operand_b22; // Compute the sum
                bit<D_WORDSIZE> sum_result_22_dw = (bit<D_WORDSIZE>) sum_result_22; // Need to double the wordsize to store the multiplication result
                if((sum_result_22_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_22_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_22_dw;
                }
                bit<D_WORDSIZE> operand_c22 = (bit<D_WORDSIZE>) meta.neuron_22_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c22 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c22;
                }
                bit<D_WORDSIZE> norm_result_22 = ((sum_result_22_dw * operand_c22) >> PRECISION);
                meta.neuron_22_data = (bit<WORDSIZE>) norm_result_22; // Resize the data to wordsize to be fowarded
                reg_neuron_22_data.write(0, meta.neuron_22_data);  // Store the value to be fowarded

                // Neuron 23:
                bit<WORDSIZE> operand_a23 = hdr.ann.data_23 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b23 = meta.neuron_23_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_23 = operand_a23 + operand_b23; // Compute the sum
                bit<D_WORDSIZE> sum_result_23_dw = (bit<D_WORDSIZE>) sum_result_23; // Need to double the wordsize to store the multiplication result
                if((sum_result_23_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_23_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_23_dw;
                }
                bit<D_WORDSIZE> operand_c23 = (bit<D_WORDSIZE>) meta.neuron_23_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c23 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c23;
                }
                bit<D_WORDSIZE> norm_result_23 = ((sum_result_23_dw * operand_c23) >> PRECISION);
                meta.neuron_23_data = (bit<WORDSIZE>) norm_result_23; // Resize the data to wordsize to be fowarded
                reg_neuron_23_data.write(0, meta.neuron_23_data);  // Store the value to be fowarded

                // Neuron 24:
                bit<WORDSIZE> operand_a24 = hdr.ann.data_24 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b24 = meta.neuron_24_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_24 = operand_a24 + operand_b24; // Compute the sum
                bit<D_WORDSIZE> sum_result_24_dw = (bit<D_WORDSIZE>) sum_result_24; // Need to double the wordsize to store the multiplication result
                if((sum_result_24_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_24_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_24_dw;
                }
                bit<D_WORDSIZE> operand_c24 = (bit<D_WORDSIZE>) meta.neuron_24_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c24 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c24;
                }
                bit<D_WORDSIZE> norm_result_24 = ((sum_result_24_dw * operand_c24) >> PRECISION);
                meta.neuron_24_data = (bit<WORDSIZE>) norm_result_24; // Resize the data to wordsize to be fowarded
                reg_neuron_24_data.write(0, meta.neuron_24_data);  // Store the value to be fowarded

                // Neuron 25:
                bit<WORDSIZE> operand_a25 = hdr.ann.data_25 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b25 = meta.neuron_25_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_25 = operand_a25 + operand_b25; // Compute the sum
                bit<D_WORDSIZE> sum_result_25_dw = (bit<D_WORDSIZE>) sum_result_25; // Need to double the wordsize to store the multiplication result
                if((sum_result_25_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_25_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_25_dw;
                }
                bit<D_WORDSIZE> operand_c25 = (bit<D_WORDSIZE>) meta.neuron_25_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c25 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c25;
                }
                bit<D_WORDSIZE> norm_result_25 = ((sum_result_25_dw * operand_c25) >> PRECISION);
                meta.neuron_25_data = (bit<WORDSIZE>) norm_result_25; // Resize the data to wordsize to be fowarded
                reg_neuron_25_data.write(0, meta.neuron_25_data);  // Store the value to be fowarded

                // Neuron 26:
                bit<WORDSIZE> operand_a26 = hdr.ann.data_26 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b26 = meta.neuron_26_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_26 = operand_a26 + operand_b26; // Compute the sum
                bit<D_WORDSIZE> sum_result_26_dw = (bit<D_WORDSIZE>) sum_result_26; // Need to double the wordsize to store the multiplication result
                if((sum_result_26_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_26_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_26_dw;
                }
                bit<D_WORDSIZE> operand_c26 = (bit<D_WORDSIZE>) meta.neuron_26_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c26 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c26;
                }
                bit<D_WORDSIZE> norm_result_26 = ((sum_result_26_dw * operand_c26) >> PRECISION);
                meta.neuron_26_data = (bit<WORDSIZE>) norm_result_26; // Resize the data to wordsize to be fowarded
                reg_neuron_26_data.write(0, meta.neuron_26_data);  // Store the value to be fowarded

                // Neuron 27:
                bit<WORDSIZE> operand_a27 = hdr.ann.data_27 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b27 = meta.neuron_27_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_27 = operand_a27 + operand_b27; // Compute the sum
                bit<D_WORDSIZE> sum_result_27_dw = (bit<D_WORDSIZE>) sum_result_27; // Need to double the wordsize to store the multiplication result
                if((sum_result_27_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_27_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_27_dw;
                }
                bit<D_WORDSIZE> operand_c27 = (bit<D_WORDSIZE>) meta.neuron_27_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c27 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c27;
                }
                bit<D_WORDSIZE> norm_result_27 = ((sum_result_27_dw * operand_c27) >> PRECISION);
                meta.neuron_27_data = (bit<WORDSIZE>) norm_result_27; // Resize the data to wordsize to be fowarded
                reg_neuron_27_data.write(0, meta.neuron_27_data);  // Store the value to be fowarded

                // Neuron 28:
                bit<WORDSIZE> operand_a28 = hdr.ann.data_28 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b28 = meta.neuron_28_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_28 = operand_a28 + operand_b28; // Compute the sum
                bit<D_WORDSIZE> sum_result_28_dw = (bit<D_WORDSIZE>) sum_result_28; // Need to double the wordsize to store the multiplication result
                if((sum_result_28_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_28_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_28_dw;
                }
                bit<D_WORDSIZE> operand_c28 = (bit<D_WORDSIZE>) meta.neuron_28_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c28 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c28;
                }
                bit<D_WORDSIZE> norm_result_28 = ((sum_result_28_dw * operand_c28) >> PRECISION);
                meta.neuron_28_data = (bit<WORDSIZE>) norm_result_28; // Resize the data to wordsize to be fowarded
                reg_neuron_28_data.write(0, meta.neuron_28_data);  // Store the value to be fowarded

                // Neuron 29:
                bit<WORDSIZE> operand_a29 = hdr.ann.data_29 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b29 = meta.neuron_29_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_29 = operand_a29 + operand_b29; // Compute the sum
                bit<D_WORDSIZE> sum_result_29_dw = (bit<D_WORDSIZE>) sum_result_29; // Need to double the wordsize to store the multiplication result
                if((sum_result_29_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_29_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_29_dw;
                }
                bit<D_WORDSIZE> operand_c29 = (bit<D_WORDSIZE>) meta.neuron_29_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c29 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c29;
                }
                bit<D_WORDSIZE> norm_result_29 = ((sum_result_29_dw * operand_c29) >> PRECISION);
                meta.neuron_29_data = (bit<WORDSIZE>) norm_result_29; // Resize the data to wordsize to be fowarded
                reg_neuron_29_data.write(0, meta.neuron_29_data);  // Store the value to be fowarded

                // Neuron 30:
                bit<WORDSIZE> operand_a30 = hdr.ann.data_30 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b30 = meta.neuron_30_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_30 = operand_a30 + operand_b30; // Compute the sum
                bit<D_WORDSIZE> sum_result_30_dw = (bit<D_WORDSIZE>) sum_result_30; // Need to double the wordsize to store the multiplication result
                if((sum_result_30_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_30_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_30_dw;
                }
                bit<D_WORDSIZE> operand_c30 = (bit<D_WORDSIZE>) meta.neuron_30_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c30 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c30;
                }
                bit<D_WORDSIZE> norm_result_30 = ((sum_result_30_dw * operand_c30) >> PRECISION);
                meta.neuron_30_data = (bit<WORDSIZE>) norm_result_30; // Resize the data to wordsize to be fowarded
                reg_neuron_30_data.write(0, meta.neuron_30_data);  // Store the value to be fowarded

                // Neuron 31:
                bit<WORDSIZE> operand_a31 = hdr.ann.data_31 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b31 = meta.neuron_31_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_31 = operand_a31 + operand_b31; // Compute the sum
                bit<D_WORDSIZE> sum_result_31_dw = (bit<D_WORDSIZE>) sum_result_31; // Need to double the wordsize to store the multiplication result
                if((sum_result_31_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_31_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_31_dw;
                }
                bit<D_WORDSIZE> operand_c31 = (bit<D_WORDSIZE>) meta.neuron_31_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c31 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c31;
                }
                bit<D_WORDSIZE> norm_result_31 = ((sum_result_31_dw * operand_c31) >> PRECISION);
                meta.neuron_31_data = (bit<WORDSIZE>) norm_result_31; // Resize the data to wordsize to be fowarded
                reg_neuron_31_data.write(0, meta.neuron_31_data);  // Store the value to be fowarded

                // Neuron 32:
                bit<WORDSIZE> operand_a32 = hdr.ann.data_32 << PRECISION; // Pass the values to registers to be able to operate them. To load the input data, which are integers, need to shift left to adequate them to FP notation Q.INT.FRAC. TO_DO need special treatment to NEGATIVE INPUT DATA!!!
                bit<WORDSIZE> operand_b32 = meta.neuron_32_mean; // Load normalization means (= weights)
                bit<WORDSIZE> sum_result_32 = operand_a32 + operand_b32; // Compute the sum
                bit<D_WORDSIZE> sum_result_32_dw = (bit<D_WORDSIZE>) sum_result_32; // Need to double the wordsize to store the multiplication result
                if((sum_result_32_dw & (1 << (WORDSIZE-1))) > 0){                            // negative number
                    sum_result_32_dw = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) sum_result_32_dw;
                }
                bit<D_WORDSIZE> operand_c32 = (bit<D_WORDSIZE>) meta.neuron_32_std;  // Load normalization std (= bias)
                // Sign extension
                if((operand_c32 & (1 << (WORDSIZE-1))) > 0){                                // negative number
                    operand_c32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_c32;
                }
                bit<D_WORDSIZE> norm_result_32 = ((sum_result_32_dw * operand_c32) >> PRECISION);
                meta.neuron_32_data = (bit<WORDSIZE>) norm_result_32; // Resize the data to wordsize to be fowarded
                reg_neuron_32_data.write(0, meta.neuron_32_data);  // Store the value to be fowarded
            }
            else if(meta.agg_func == FUNC_WEIGHTED_SUM_32_TO_32){                // Aggregation Function = weighted sum = bias + Summation_i=1_to_n(data_i * weight_i)
                if(meta.n_received_stimuli == 1){ // Check if this is the first stimulus in an ANN run
                    // If yes, initialize neuron_data with the neuron bias, the neuron bias is added to the accumulator (neuron_data) just once
                    meta.neuron_1_data = meta.neuron_1_bias;
                    meta.neuron_2_data = meta.neuron_2_bias;
                    meta.neuron_3_data = meta.neuron_3_bias;
                    meta.neuron_4_data = meta.neuron_4_bias;
                    meta.neuron_5_data = meta.neuron_5_bias;
                    meta.neuron_6_data = meta.neuron_6_bias;
                    meta.neuron_7_data = meta.neuron_7_bias;
                    meta.neuron_8_data = meta.neuron_8_bias;
                    meta.neuron_9_data = meta.neuron_9_bias;
                    meta.neuron_10_data = meta.neuron_10_bias;
                    meta.neuron_11_data = meta.neuron_11_bias;
                    meta.neuron_12_data = meta.neuron_12_bias;
                    meta.neuron_13_data = meta.neuron_13_bias;
                    meta.neuron_14_data = meta.neuron_14_bias;
                    meta.neuron_15_data = meta.neuron_15_bias;
                    meta.neuron_16_data = meta.neuron_16_bias;
                    meta.neuron_17_data = meta.neuron_17_bias;
                    meta.neuron_18_data = meta.neuron_18_bias;
                    meta.neuron_19_data = meta.neuron_19_bias;
                    meta.neuron_20_data = meta.neuron_20_bias;
                    meta.neuron_21_data = meta.neuron_21_bias;
                    meta.neuron_22_data = meta.neuron_22_bias;
                    meta.neuron_23_data = meta.neuron_23_bias;
                    meta.neuron_24_data = meta.neuron_24_bias;
                    meta.neuron_25_data = meta.neuron_25_bias;
                    meta.neuron_26_data = meta.neuron_26_bias;
                    meta.neuron_27_data = meta.neuron_27_bias;
                    meta.neuron_28_data = meta.neuron_28_bias;
                    meta.neuron_29_data = meta.neuron_29_bias;
                    meta.neuron_30_data = meta.neuron_30_bias;
                    meta.neuron_31_data = meta.neuron_31_bias;
                    meta.neuron_32_data = meta.neuron_32_bias;
                }
                else{
                    // If not, read the neuron_data value stored in the register
                    reg_neuron_1_data.read(meta.neuron_1_data, 0);
                    reg_neuron_2_data.read(meta.neuron_2_data, 0);
                    reg_neuron_3_data.read(meta.neuron_3_data, 0);
                    reg_neuron_4_data.read(meta.neuron_4_data, 0);
                    reg_neuron_5_data.read(meta.neuron_5_data, 0);
                    reg_neuron_6_data.read(meta.neuron_6_data, 0);
                    reg_neuron_7_data.read(meta.neuron_7_data, 0);
                    reg_neuron_8_data.read(meta.neuron_8_data, 0);
                    reg_neuron_9_data.read(meta.neuron_9_data, 0);
                    reg_neuron_10_data.read(meta.neuron_10_data, 0);
                    reg_neuron_11_data.read(meta.neuron_11_data, 0);
                    reg_neuron_12_data.read(meta.neuron_12_data, 0);
                    reg_neuron_13_data.read(meta.neuron_13_data, 0);
                    reg_neuron_14_data.read(meta.neuron_14_data, 0);
                    reg_neuron_15_data.read(meta.neuron_15_data, 0);
                    reg_neuron_16_data.read(meta.neuron_16_data, 0);
                    reg_neuron_17_data.read(meta.neuron_17_data, 0);
                    reg_neuron_18_data.read(meta.neuron_18_data, 0);
                    reg_neuron_19_data.read(meta.neuron_19_data, 0);
                    reg_neuron_20_data.read(meta.neuron_20_data, 0);
                    reg_neuron_21_data.read(meta.neuron_21_data, 0);
                    reg_neuron_22_data.read(meta.neuron_22_data, 0);
                    reg_neuron_23_data.read(meta.neuron_23_data, 0);
                    reg_neuron_24_data.read(meta.neuron_24_data, 0);
                    reg_neuron_25_data.read(meta.neuron_25_data, 0);
                    reg_neuron_26_data.read(meta.neuron_26_data, 0);
                    reg_neuron_27_data.read(meta.neuron_27_data, 0);
                    reg_neuron_28_data.read(meta.neuron_28_data, 0);
                    reg_neuron_29_data.read(meta.neuron_29_data, 0);
                    reg_neuron_30_data.read(meta.neuron_30_data, 0);
                    reg_neuron_31_data.read(meta.neuron_31_data, 0);
                    reg_neuron_32_data.read(meta.neuron_32_data, 0);
                }
                tab_n2n_weight_32_to_32_neurons.apply();	// Get the neuron weights
                // Load data and perform sign extension

                bit<D_WORDSIZE> operand_b1 = (bit<D_WORDSIZE>) hdr.ann.data_1;
                // Sign extension
                if((operand_b1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b1;
                }
                bit<D_WORDSIZE> operand_b2 = (bit<D_WORDSIZE>) hdr.ann.data_2;
                // Sign extension
                if((operand_b2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b2;
                }
                bit<D_WORDSIZE> operand_b3 = (bit<D_WORDSIZE>) hdr.ann.data_3;
                // Sign extension
                if((operand_b3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b3;
                }
                bit<D_WORDSIZE> operand_b4 = (bit<D_WORDSIZE>) hdr.ann.data_4;
                // Sign extension
                if((operand_b4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b4;
                }
                bit<D_WORDSIZE> operand_b5 = (bit<D_WORDSIZE>) hdr.ann.data_5;
                // Sign extension
                if((operand_b5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b5;
                }
                bit<D_WORDSIZE> operand_b6 = (bit<D_WORDSIZE>) hdr.ann.data_6;
                // Sign extension
                if((operand_b6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b6;
                }
                bit<D_WORDSIZE> operand_b7 = (bit<D_WORDSIZE>) hdr.ann.data_7;
                // Sign extension
                if((operand_b7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b7;
                }
                bit<D_WORDSIZE> operand_b8 = (bit<D_WORDSIZE>) hdr.ann.data_8;
                // Sign extension
                if((operand_b8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b8;
                }
                bit<D_WORDSIZE> operand_b9 = (bit<D_WORDSIZE>) hdr.ann.data_9;
                // Sign extension
                if((operand_b9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b9;
                }
                bit<D_WORDSIZE> operand_b10 = (bit<D_WORDSIZE>) hdr.ann.data_10;
                // Sign extension
                if((operand_b10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b10;
                }
                bit<D_WORDSIZE> operand_b11 = (bit<D_WORDSIZE>) hdr.ann.data_11;
                // Sign extension
                if((operand_b11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b11;
                }
                bit<D_WORDSIZE> operand_b12 = (bit<D_WORDSIZE>) hdr.ann.data_12;
                // Sign extension
                if((operand_b12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b12;
                }
                bit<D_WORDSIZE> operand_b13 = (bit<D_WORDSIZE>) hdr.ann.data_13;
                // Sign extension
                if((operand_b13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b13;
                }
                bit<D_WORDSIZE> operand_b14 = (bit<D_WORDSIZE>) hdr.ann.data_14;
                // Sign extension
                if((operand_b14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b14;
                }
                bit<D_WORDSIZE> operand_b15 = (bit<D_WORDSIZE>) hdr.ann.data_15;
                // Sign extension
                if((operand_b15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b15;
                }
                bit<D_WORDSIZE> operand_b16 = (bit<D_WORDSIZE>) hdr.ann.data_16;
                // Sign extension
                if((operand_b16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b16;
                }
                bit<D_WORDSIZE> operand_b17 = (bit<D_WORDSIZE>) hdr.ann.data_17;
                // Sign extension
                if((operand_b17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b17;
                }
                bit<D_WORDSIZE> operand_b18 = (bit<D_WORDSIZE>) hdr.ann.data_18;
                // Sign extension
                if((operand_b18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b18;
                }
                bit<D_WORDSIZE> operand_b19 = (bit<D_WORDSIZE>) hdr.ann.data_19;
                // Sign extension
                if((operand_b19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b19;
                }
                bit<D_WORDSIZE> operand_b20 = (bit<D_WORDSIZE>) hdr.ann.data_20;
                // Sign extension
                if((operand_b20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b20;
                }
                bit<D_WORDSIZE> operand_b21 = (bit<D_WORDSIZE>) hdr.ann.data_21;
                // Sign extension
                if((operand_b21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b21;
                }
                bit<D_WORDSIZE> operand_b22 = (bit<D_WORDSIZE>) hdr.ann.data_22;
                // Sign extension
                if((operand_b22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b22;
                }
                bit<D_WORDSIZE> operand_b23 = (bit<D_WORDSIZE>) hdr.ann.data_23;
                // Sign extension
                if((operand_b23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b23;
                }
                bit<D_WORDSIZE> operand_b24 = (bit<D_WORDSIZE>) hdr.ann.data_24;
                // Sign extension
                if((operand_b24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b24;
                }
                bit<D_WORDSIZE> operand_b25 = (bit<D_WORDSIZE>) hdr.ann.data_25;
                // Sign extension
                if((operand_b25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b25;
                }
                bit<D_WORDSIZE> operand_b26 = (bit<D_WORDSIZE>) hdr.ann.data_26;
                // Sign extension
                if((operand_b26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b26;
                }
                bit<D_WORDSIZE> operand_b27 = (bit<D_WORDSIZE>) hdr.ann.data_27;
                // Sign extension
                if((operand_b27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b27;
                }
                bit<D_WORDSIZE> operand_b28 = (bit<D_WORDSIZE>) hdr.ann.data_28;
                // Sign extension
                if((operand_b28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b28;
                }
                bit<D_WORDSIZE> operand_b29 = (bit<D_WORDSIZE>) hdr.ann.data_29;
                // Sign extension
                if((operand_b29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b29;
                }
                bit<D_WORDSIZE> operand_b30 = (bit<D_WORDSIZE>) hdr.ann.data_30;
                // Sign extension
                if((operand_b30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b30;
                }
                bit<D_WORDSIZE> operand_b31 = (bit<D_WORDSIZE>) hdr.ann.data_31;
                // Sign extension
                if((operand_b31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b31;
                }
                bit<D_WORDSIZE> operand_b32 = (bit<D_WORDSIZE>) hdr.ann.data_32;
                // Sign extension
                if((operand_b32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b32;
                }
                // Neuron 1:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_1_1 = (bit<D_WORDSIZE>) meta.n2n_1_weight_1;
                bit<D_WORDSIZE> operand_a_1_2 = (bit<D_WORDSIZE>) meta.n2n_1_weight_2;
                bit<D_WORDSIZE> operand_a_1_3 = (bit<D_WORDSIZE>) meta.n2n_1_weight_3;
                bit<D_WORDSIZE> operand_a_1_4 = (bit<D_WORDSIZE>) meta.n2n_1_weight_4;
                bit<D_WORDSIZE> operand_a_1_5 = (bit<D_WORDSIZE>) meta.n2n_1_weight_5;
                bit<D_WORDSIZE> operand_a_1_6 = (bit<D_WORDSIZE>) meta.n2n_1_weight_6;
                bit<D_WORDSIZE> operand_a_1_7 = (bit<D_WORDSIZE>) meta.n2n_1_weight_7;
                bit<D_WORDSIZE> operand_a_1_8 = (bit<D_WORDSIZE>) meta.n2n_1_weight_8;
                bit<D_WORDSIZE> operand_a_1_9 = (bit<D_WORDSIZE>) meta.n2n_1_weight_9;
                bit<D_WORDSIZE> operand_a_1_10 = (bit<D_WORDSIZE>) meta.n2n_1_weight_10;
                bit<D_WORDSIZE> operand_a_1_11 = (bit<D_WORDSIZE>) meta.n2n_1_weight_11;
                bit<D_WORDSIZE> operand_a_1_12 = (bit<D_WORDSIZE>) meta.n2n_1_weight_12;
                bit<D_WORDSIZE> operand_a_1_13 = (bit<D_WORDSIZE>) meta.n2n_1_weight_13;
                bit<D_WORDSIZE> operand_a_1_14 = (bit<D_WORDSIZE>) meta.n2n_1_weight_14;
                bit<D_WORDSIZE> operand_a_1_15 = (bit<D_WORDSIZE>) meta.n2n_1_weight_15;
                bit<D_WORDSIZE> operand_a_1_16 = (bit<D_WORDSIZE>) meta.n2n_1_weight_16;
                bit<D_WORDSIZE> operand_a_1_17 = (bit<D_WORDSIZE>) meta.n2n_1_weight_17;
                bit<D_WORDSIZE> operand_a_1_18 = (bit<D_WORDSIZE>) meta.n2n_1_weight_18;
                bit<D_WORDSIZE> operand_a_1_19 = (bit<D_WORDSIZE>) meta.n2n_1_weight_19;
                bit<D_WORDSIZE> operand_a_1_20 = (bit<D_WORDSIZE>) meta.n2n_1_weight_20;
                bit<D_WORDSIZE> operand_a_1_21 = (bit<D_WORDSIZE>) meta.n2n_1_weight_21;
                bit<D_WORDSIZE> operand_a_1_22 = (bit<D_WORDSIZE>) meta.n2n_1_weight_22;
                bit<D_WORDSIZE> operand_a_1_23 = (bit<D_WORDSIZE>) meta.n2n_1_weight_23;
                bit<D_WORDSIZE> operand_a_1_24 = (bit<D_WORDSIZE>) meta.n2n_1_weight_24;
                bit<D_WORDSIZE> operand_a_1_25 = (bit<D_WORDSIZE>) meta.n2n_1_weight_25;
                bit<D_WORDSIZE> operand_a_1_26 = (bit<D_WORDSIZE>) meta.n2n_1_weight_26;
                bit<D_WORDSIZE> operand_a_1_27 = (bit<D_WORDSIZE>) meta.n2n_1_weight_27;
                bit<D_WORDSIZE> operand_a_1_28 = (bit<D_WORDSIZE>) meta.n2n_1_weight_28;
                bit<D_WORDSIZE> operand_a_1_29 = (bit<D_WORDSIZE>) meta.n2n_1_weight_29;
                bit<D_WORDSIZE> operand_a_1_30 = (bit<D_WORDSIZE>) meta.n2n_1_weight_30;
                bit<D_WORDSIZE> operand_a_1_31 = (bit<D_WORDSIZE>) meta.n2n_1_weight_31;
                bit<D_WORDSIZE> operand_a_1_32 = (bit<D_WORDSIZE>) meta.n2n_1_weight_32;
                // Sign extension
                if((operand_a_1_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_1;
                }
                if((operand_a_1_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_2;
                }
                if((operand_a_1_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_3;
                }
                if((operand_a_1_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_4;
                }
                if((operand_a_1_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_5;
                }
                if((operand_a_1_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_6;
                }
                if((operand_a_1_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_7;
                }
                if((operand_a_1_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_8;
                }
                if((operand_a_1_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_9;
                }
                if((operand_a_1_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_10;
                }
                if((operand_a_1_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_11;
                }
                if((operand_a_1_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_12;
                }
                if((operand_a_1_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_13;
                }
                if((operand_a_1_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_14;
                }
                if((operand_a_1_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_15;
                }
                if((operand_a_1_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_16;
                }
                if((operand_a_1_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_17;
                }
                if((operand_a_1_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_18;
                }
                if((operand_a_1_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_19;
                }
                if((operand_a_1_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_20;
                }
                if((operand_a_1_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_21;
                }
                if((operand_a_1_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_22;
                }
                if((operand_a_1_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_23;
                }
                if((operand_a_1_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_24;
                }
                if((operand_a_1_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_25;
                }
                if((operand_a_1_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_26;
                }
                if((operand_a_1_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_27;
                }
                if((operand_a_1_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_28;
                }
                if((operand_a_1_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_29;
                }
                if((operand_a_1_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_30;
                }
                if((operand_a_1_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_31;
                }
                if((operand_a_1_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_1_1 = ((operand_a_1_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_1_2 = ((operand_a_1_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_1_3 = ((operand_a_1_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_1_4 = ((operand_a_1_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_1_5 = ((operand_a_1_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_1_6 = ((operand_a_1_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_1_7 = ((operand_a_1_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_1_8 = ((operand_a_1_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_1_9 = ((operand_a_1_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_1_10 = ((operand_a_1_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_1_11 = ((operand_a_1_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_1_12 = ((operand_a_1_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_1_13 = ((operand_a_1_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_1_14 = ((operand_a_1_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_1_15 = ((operand_a_1_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_1_16 = ((operand_a_1_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_1_17 = ((operand_a_1_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_1_18 = ((operand_a_1_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_1_19 = ((operand_a_1_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_1_20 = ((operand_a_1_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_1_21 = ((operand_a_1_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_1_22 = ((operand_a_1_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_1_23 = ((operand_a_1_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_1_24 = ((operand_a_1_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_1_25 = ((operand_a_1_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_1_26 = ((operand_a_1_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_1_27 = ((operand_a_1_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_1_28 = ((operand_a_1_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_1_29 = ((operand_a_1_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_1_30 = ((operand_a_1_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_1_31 = ((operand_a_1_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_1_32 = ((operand_a_1_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_1_data = meta.neuron_1_data + (bit<WORDSIZE>) res_1_1 + (bit<WORDSIZE>) res_1_2 + (bit<WORDSIZE>) res_1_3 + (bit<WORDSIZE>) res_1_4 + (bit<WORDSIZE>) res_1_5 + (bit<WORDSIZE>) res_1_6 + (bit<WORDSIZE>) res_1_7 + (bit<WORDSIZE>) res_1_8 + (bit<WORDSIZE>) res_1_9 + (bit<WORDSIZE>) res_1_10 + (bit<WORDSIZE>) res_1_11 + (bit<WORDSIZE>) res_1_12 + (bit<WORDSIZE>) res_1_13 + (bit<WORDSIZE>) res_1_14 + (bit<WORDSIZE>) res_1_15 + (bit<WORDSIZE>) res_1_16 + (bit<WORDSIZE>) res_1_17 + (bit<WORDSIZE>) res_1_18 + (bit<WORDSIZE>) res_1_19 + (bit<WORDSIZE>) res_1_20 + (bit<WORDSIZE>) res_1_21 + (bit<WORDSIZE>) res_1_22 + (bit<WORDSIZE>) res_1_23 + (bit<WORDSIZE>) res_1_24 + (bit<WORDSIZE>) res_1_25 + (bit<WORDSIZE>) res_1_26 + (bit<WORDSIZE>) res_1_27 + (bit<WORDSIZE>) res_1_28 + (bit<WORDSIZE>) res_1_29 + (bit<WORDSIZE>) res_1_30 + (bit<WORDSIZE>) res_1_31 + (bit<WORDSIZE>) res_1_32;
                // Store data to be fowarded
                reg_neuron_1_data.write(0, meta.neuron_1_data);

                // Neuron 2:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_2_1 = (bit<D_WORDSIZE>) meta.n2n_2_weight_1;
                bit<D_WORDSIZE> operand_a_2_2 = (bit<D_WORDSIZE>) meta.n2n_2_weight_2;
                bit<D_WORDSIZE> operand_a_2_3 = (bit<D_WORDSIZE>) meta.n2n_2_weight_3;
                bit<D_WORDSIZE> operand_a_2_4 = (bit<D_WORDSIZE>) meta.n2n_2_weight_4;
                bit<D_WORDSIZE> operand_a_2_5 = (bit<D_WORDSIZE>) meta.n2n_2_weight_5;
                bit<D_WORDSIZE> operand_a_2_6 = (bit<D_WORDSIZE>) meta.n2n_2_weight_6;
                bit<D_WORDSIZE> operand_a_2_7 = (bit<D_WORDSIZE>) meta.n2n_2_weight_7;
                bit<D_WORDSIZE> operand_a_2_8 = (bit<D_WORDSIZE>) meta.n2n_2_weight_8;
                bit<D_WORDSIZE> operand_a_2_9 = (bit<D_WORDSIZE>) meta.n2n_2_weight_9;
                bit<D_WORDSIZE> operand_a_2_10 = (bit<D_WORDSIZE>) meta.n2n_2_weight_10;
                bit<D_WORDSIZE> operand_a_2_11 = (bit<D_WORDSIZE>) meta.n2n_2_weight_11;
                bit<D_WORDSIZE> operand_a_2_12 = (bit<D_WORDSIZE>) meta.n2n_2_weight_12;
                bit<D_WORDSIZE> operand_a_2_13 = (bit<D_WORDSIZE>) meta.n2n_2_weight_13;
                bit<D_WORDSIZE> operand_a_2_14 = (bit<D_WORDSIZE>) meta.n2n_2_weight_14;
                bit<D_WORDSIZE> operand_a_2_15 = (bit<D_WORDSIZE>) meta.n2n_2_weight_15;
                bit<D_WORDSIZE> operand_a_2_16 = (bit<D_WORDSIZE>) meta.n2n_2_weight_16;
                bit<D_WORDSIZE> operand_a_2_17 = (bit<D_WORDSIZE>) meta.n2n_2_weight_17;
                bit<D_WORDSIZE> operand_a_2_18 = (bit<D_WORDSIZE>) meta.n2n_2_weight_18;
                bit<D_WORDSIZE> operand_a_2_19 = (bit<D_WORDSIZE>) meta.n2n_2_weight_19;
                bit<D_WORDSIZE> operand_a_2_20 = (bit<D_WORDSIZE>) meta.n2n_2_weight_20;
                bit<D_WORDSIZE> operand_a_2_21 = (bit<D_WORDSIZE>) meta.n2n_2_weight_21;
                bit<D_WORDSIZE> operand_a_2_22 = (bit<D_WORDSIZE>) meta.n2n_2_weight_22;
                bit<D_WORDSIZE> operand_a_2_23 = (bit<D_WORDSIZE>) meta.n2n_2_weight_23;
                bit<D_WORDSIZE> operand_a_2_24 = (bit<D_WORDSIZE>) meta.n2n_2_weight_24;
                bit<D_WORDSIZE> operand_a_2_25 = (bit<D_WORDSIZE>) meta.n2n_2_weight_25;
                bit<D_WORDSIZE> operand_a_2_26 = (bit<D_WORDSIZE>) meta.n2n_2_weight_26;
                bit<D_WORDSIZE> operand_a_2_27 = (bit<D_WORDSIZE>) meta.n2n_2_weight_27;
                bit<D_WORDSIZE> operand_a_2_28 = (bit<D_WORDSIZE>) meta.n2n_2_weight_28;
                bit<D_WORDSIZE> operand_a_2_29 = (bit<D_WORDSIZE>) meta.n2n_2_weight_29;
                bit<D_WORDSIZE> operand_a_2_30 = (bit<D_WORDSIZE>) meta.n2n_2_weight_30;
                bit<D_WORDSIZE> operand_a_2_31 = (bit<D_WORDSIZE>) meta.n2n_2_weight_31;
                bit<D_WORDSIZE> operand_a_2_32 = (bit<D_WORDSIZE>) meta.n2n_2_weight_32;
                // Sign extension
                if((operand_a_2_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_1;
                }
                if((operand_a_2_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_2;
                }
                if((operand_a_2_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_3;
                }
                if((operand_a_2_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_4;
                }
                if((operand_a_2_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_5;
                }
                if((operand_a_2_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_6;
                }
                if((operand_a_2_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_7;
                }
                if((operand_a_2_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_8;
                }
                if((operand_a_2_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_9;
                }
                if((operand_a_2_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_10;
                }
                if((operand_a_2_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_11;
                }
                if((operand_a_2_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_12;
                }
                if((operand_a_2_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_13;
                }
                if((operand_a_2_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_14;
                }
                if((operand_a_2_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_15;
                }
                if((operand_a_2_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_16;
                }
                if((operand_a_2_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_17;
                }
                if((operand_a_2_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_18;
                }
                if((operand_a_2_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_19;
                }
                if((operand_a_2_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_20;
                }
                if((operand_a_2_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_21;
                }
                if((operand_a_2_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_22;
                }
                if((operand_a_2_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_23;
                }
                if((operand_a_2_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_24;
                }
                if((operand_a_2_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_25;
                }
                if((operand_a_2_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_26;
                }
                if((operand_a_2_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_27;
                }
                if((operand_a_2_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_28;
                }
                if((operand_a_2_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_29;
                }
                if((operand_a_2_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_30;
                }
                if((operand_a_2_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_31;
                }
                if((operand_a_2_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_2_1 = ((operand_a_2_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_2_2 = ((operand_a_2_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_2_3 = ((operand_a_2_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_2_4 = ((operand_a_2_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_2_5 = ((operand_a_2_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_2_6 = ((operand_a_2_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_2_7 = ((operand_a_2_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_2_8 = ((operand_a_2_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_2_9 = ((operand_a_2_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_2_10 = ((operand_a_2_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_2_11 = ((operand_a_2_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_2_12 = ((operand_a_2_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_2_13 = ((operand_a_2_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_2_14 = ((operand_a_2_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_2_15 = ((operand_a_2_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_2_16 = ((operand_a_2_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_2_17 = ((operand_a_2_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_2_18 = ((operand_a_2_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_2_19 = ((operand_a_2_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_2_20 = ((operand_a_2_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_2_21 = ((operand_a_2_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_2_22 = ((operand_a_2_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_2_23 = ((operand_a_2_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_2_24 = ((operand_a_2_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_2_25 = ((operand_a_2_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_2_26 = ((operand_a_2_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_2_27 = ((operand_a_2_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_2_28 = ((operand_a_2_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_2_29 = ((operand_a_2_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_2_30 = ((operand_a_2_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_2_31 = ((operand_a_2_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_2_32 = ((operand_a_2_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_2_data = meta.neuron_2_data + (bit<WORDSIZE>) res_2_1 + (bit<WORDSIZE>) res_2_2 + (bit<WORDSIZE>) res_2_3 + (bit<WORDSIZE>) res_2_4 + (bit<WORDSIZE>) res_2_5 + (bit<WORDSIZE>) res_2_6 + (bit<WORDSIZE>) res_2_7 + (bit<WORDSIZE>) res_2_8 + (bit<WORDSIZE>) res_2_9 + (bit<WORDSIZE>) res_2_10 + (bit<WORDSIZE>) res_2_11 + (bit<WORDSIZE>) res_2_12 + (bit<WORDSIZE>) res_2_13 + (bit<WORDSIZE>) res_2_14 + (bit<WORDSIZE>) res_2_15 + (bit<WORDSIZE>) res_2_16 + (bit<WORDSIZE>) res_2_17 + (bit<WORDSIZE>) res_2_18 + (bit<WORDSIZE>) res_2_19 + (bit<WORDSIZE>) res_2_20 + (bit<WORDSIZE>) res_2_21 + (bit<WORDSIZE>) res_2_22 + (bit<WORDSIZE>) res_2_23 + (bit<WORDSIZE>) res_2_24 + (bit<WORDSIZE>) res_2_25 + (bit<WORDSIZE>) res_2_26 + (bit<WORDSIZE>) res_2_27 + (bit<WORDSIZE>) res_2_28 + (bit<WORDSIZE>) res_2_29 + (bit<WORDSIZE>) res_2_30 + (bit<WORDSIZE>) res_2_31 + (bit<WORDSIZE>) res_2_32;
                // Store data to be fowarded
                reg_neuron_2_data.write(0, meta.neuron_2_data);

                // Neuron 3:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_3_1 = (bit<D_WORDSIZE>) meta.n2n_3_weight_1;
                bit<D_WORDSIZE> operand_a_3_2 = (bit<D_WORDSIZE>) meta.n2n_3_weight_2;
                bit<D_WORDSIZE> operand_a_3_3 = (bit<D_WORDSIZE>) meta.n2n_3_weight_3;
                bit<D_WORDSIZE> operand_a_3_4 = (bit<D_WORDSIZE>) meta.n2n_3_weight_4;
                bit<D_WORDSIZE> operand_a_3_5 = (bit<D_WORDSIZE>) meta.n2n_3_weight_5;
                bit<D_WORDSIZE> operand_a_3_6 = (bit<D_WORDSIZE>) meta.n2n_3_weight_6;
                bit<D_WORDSIZE> operand_a_3_7 = (bit<D_WORDSIZE>) meta.n2n_3_weight_7;
                bit<D_WORDSIZE> operand_a_3_8 = (bit<D_WORDSIZE>) meta.n2n_3_weight_8;
                bit<D_WORDSIZE> operand_a_3_9 = (bit<D_WORDSIZE>) meta.n2n_3_weight_9;
                bit<D_WORDSIZE> operand_a_3_10 = (bit<D_WORDSIZE>) meta.n2n_3_weight_10;
                bit<D_WORDSIZE> operand_a_3_11 = (bit<D_WORDSIZE>) meta.n2n_3_weight_11;
                bit<D_WORDSIZE> operand_a_3_12 = (bit<D_WORDSIZE>) meta.n2n_3_weight_12;
                bit<D_WORDSIZE> operand_a_3_13 = (bit<D_WORDSIZE>) meta.n2n_3_weight_13;
                bit<D_WORDSIZE> operand_a_3_14 = (bit<D_WORDSIZE>) meta.n2n_3_weight_14;
                bit<D_WORDSIZE> operand_a_3_15 = (bit<D_WORDSIZE>) meta.n2n_3_weight_15;
                bit<D_WORDSIZE> operand_a_3_16 = (bit<D_WORDSIZE>) meta.n2n_3_weight_16;
                bit<D_WORDSIZE> operand_a_3_17 = (bit<D_WORDSIZE>) meta.n2n_3_weight_17;
                bit<D_WORDSIZE> operand_a_3_18 = (bit<D_WORDSIZE>) meta.n2n_3_weight_18;
                bit<D_WORDSIZE> operand_a_3_19 = (bit<D_WORDSIZE>) meta.n2n_3_weight_19;
                bit<D_WORDSIZE> operand_a_3_20 = (bit<D_WORDSIZE>) meta.n2n_3_weight_20;
                bit<D_WORDSIZE> operand_a_3_21 = (bit<D_WORDSIZE>) meta.n2n_3_weight_21;
                bit<D_WORDSIZE> operand_a_3_22 = (bit<D_WORDSIZE>) meta.n2n_3_weight_22;
                bit<D_WORDSIZE> operand_a_3_23 = (bit<D_WORDSIZE>) meta.n2n_3_weight_23;
                bit<D_WORDSIZE> operand_a_3_24 = (bit<D_WORDSIZE>) meta.n2n_3_weight_24;
                bit<D_WORDSIZE> operand_a_3_25 = (bit<D_WORDSIZE>) meta.n2n_3_weight_25;
                bit<D_WORDSIZE> operand_a_3_26 = (bit<D_WORDSIZE>) meta.n2n_3_weight_26;
                bit<D_WORDSIZE> operand_a_3_27 = (bit<D_WORDSIZE>) meta.n2n_3_weight_27;
                bit<D_WORDSIZE> operand_a_3_28 = (bit<D_WORDSIZE>) meta.n2n_3_weight_28;
                bit<D_WORDSIZE> operand_a_3_29 = (bit<D_WORDSIZE>) meta.n2n_3_weight_29;
                bit<D_WORDSIZE> operand_a_3_30 = (bit<D_WORDSIZE>) meta.n2n_3_weight_30;
                bit<D_WORDSIZE> operand_a_3_31 = (bit<D_WORDSIZE>) meta.n2n_3_weight_31;
                bit<D_WORDSIZE> operand_a_3_32 = (bit<D_WORDSIZE>) meta.n2n_3_weight_32;
                // Sign extension
                if((operand_a_3_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_1;
                }
                if((operand_a_3_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_2;
                }
                if((operand_a_3_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_3;
                }
                if((operand_a_3_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_4;
                }
                if((operand_a_3_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_5;
                }
                if((operand_a_3_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_6;
                }
                if((operand_a_3_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_7;
                }
                if((operand_a_3_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_8;
                }
                if((operand_a_3_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_9;
                }
                if((operand_a_3_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_10;
                }
                if((operand_a_3_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_11;
                }
                if((operand_a_3_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_12;
                }
                if((operand_a_3_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_13;
                }
                if((operand_a_3_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_14;
                }
                if((operand_a_3_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_15;
                }
                if((operand_a_3_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_16;
                }
                if((operand_a_3_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_17;
                }
                if((operand_a_3_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_18;
                }
                if((operand_a_3_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_19;
                }
                if((operand_a_3_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_20;
                }
                if((operand_a_3_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_21;
                }
                if((operand_a_3_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_22;
                }
                if((operand_a_3_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_23;
                }
                if((operand_a_3_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_24;
                }
                if((operand_a_3_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_25;
                }
                if((operand_a_3_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_26;
                }
                if((operand_a_3_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_27;
                }
                if((operand_a_3_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_28;
                }
                if((operand_a_3_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_29;
                }
                if((operand_a_3_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_30;
                }
                if((operand_a_3_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_31;
                }
                if((operand_a_3_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_3_1 = ((operand_a_3_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_3_2 = ((operand_a_3_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_3_3 = ((operand_a_3_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_3_4 = ((operand_a_3_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_3_5 = ((operand_a_3_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_3_6 = ((operand_a_3_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_3_7 = ((operand_a_3_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_3_8 = ((operand_a_3_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_3_9 = ((operand_a_3_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_3_10 = ((operand_a_3_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_3_11 = ((operand_a_3_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_3_12 = ((operand_a_3_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_3_13 = ((operand_a_3_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_3_14 = ((operand_a_3_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_3_15 = ((operand_a_3_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_3_16 = ((operand_a_3_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_3_17 = ((operand_a_3_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_3_18 = ((operand_a_3_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_3_19 = ((operand_a_3_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_3_20 = ((operand_a_3_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_3_21 = ((operand_a_3_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_3_22 = ((operand_a_3_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_3_23 = ((operand_a_3_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_3_24 = ((operand_a_3_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_3_25 = ((operand_a_3_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_3_26 = ((operand_a_3_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_3_27 = ((operand_a_3_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_3_28 = ((operand_a_3_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_3_29 = ((operand_a_3_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_3_30 = ((operand_a_3_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_3_31 = ((operand_a_3_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_3_32 = ((operand_a_3_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_3_data = meta.neuron_3_data + (bit<WORDSIZE>) res_3_1 + (bit<WORDSIZE>) res_3_2 + (bit<WORDSIZE>) res_3_3 + (bit<WORDSIZE>) res_3_4 + (bit<WORDSIZE>) res_3_5 + (bit<WORDSIZE>) res_3_6 + (bit<WORDSIZE>) res_3_7 + (bit<WORDSIZE>) res_3_8 + (bit<WORDSIZE>) res_3_9 + (bit<WORDSIZE>) res_3_10 + (bit<WORDSIZE>) res_3_11 + (bit<WORDSIZE>) res_3_12 + (bit<WORDSIZE>) res_3_13 + (bit<WORDSIZE>) res_3_14 + (bit<WORDSIZE>) res_3_15 + (bit<WORDSIZE>) res_3_16 + (bit<WORDSIZE>) res_3_17 + (bit<WORDSIZE>) res_3_18 + (bit<WORDSIZE>) res_3_19 + (bit<WORDSIZE>) res_3_20 + (bit<WORDSIZE>) res_3_21 + (bit<WORDSIZE>) res_3_22 + (bit<WORDSIZE>) res_3_23 + (bit<WORDSIZE>) res_3_24 + (bit<WORDSIZE>) res_3_25 + (bit<WORDSIZE>) res_3_26 + (bit<WORDSIZE>) res_3_27 + (bit<WORDSIZE>) res_3_28 + (bit<WORDSIZE>) res_3_29 + (bit<WORDSIZE>) res_3_30 + (bit<WORDSIZE>) res_3_31 + (bit<WORDSIZE>) res_3_32;
                // Store data to be fowarded
                reg_neuron_3_data.write(0, meta.neuron_3_data);

                // Neuron 4:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_4_1 = (bit<D_WORDSIZE>) meta.n2n_4_weight_1;
                bit<D_WORDSIZE> operand_a_4_2 = (bit<D_WORDSIZE>) meta.n2n_4_weight_2;
                bit<D_WORDSIZE> operand_a_4_3 = (bit<D_WORDSIZE>) meta.n2n_4_weight_3;
                bit<D_WORDSIZE> operand_a_4_4 = (bit<D_WORDSIZE>) meta.n2n_4_weight_4;
                bit<D_WORDSIZE> operand_a_4_5 = (bit<D_WORDSIZE>) meta.n2n_4_weight_5;
                bit<D_WORDSIZE> operand_a_4_6 = (bit<D_WORDSIZE>) meta.n2n_4_weight_6;
                bit<D_WORDSIZE> operand_a_4_7 = (bit<D_WORDSIZE>) meta.n2n_4_weight_7;
                bit<D_WORDSIZE> operand_a_4_8 = (bit<D_WORDSIZE>) meta.n2n_4_weight_8;
                bit<D_WORDSIZE> operand_a_4_9 = (bit<D_WORDSIZE>) meta.n2n_4_weight_9;
                bit<D_WORDSIZE> operand_a_4_10 = (bit<D_WORDSIZE>) meta.n2n_4_weight_10;
                bit<D_WORDSIZE> operand_a_4_11 = (bit<D_WORDSIZE>) meta.n2n_4_weight_11;
                bit<D_WORDSIZE> operand_a_4_12 = (bit<D_WORDSIZE>) meta.n2n_4_weight_12;
                bit<D_WORDSIZE> operand_a_4_13 = (bit<D_WORDSIZE>) meta.n2n_4_weight_13;
                bit<D_WORDSIZE> operand_a_4_14 = (bit<D_WORDSIZE>) meta.n2n_4_weight_14;
                bit<D_WORDSIZE> operand_a_4_15 = (bit<D_WORDSIZE>) meta.n2n_4_weight_15;
                bit<D_WORDSIZE> operand_a_4_16 = (bit<D_WORDSIZE>) meta.n2n_4_weight_16;
                bit<D_WORDSIZE> operand_a_4_17 = (bit<D_WORDSIZE>) meta.n2n_4_weight_17;
                bit<D_WORDSIZE> operand_a_4_18 = (bit<D_WORDSIZE>) meta.n2n_4_weight_18;
                bit<D_WORDSIZE> operand_a_4_19 = (bit<D_WORDSIZE>) meta.n2n_4_weight_19;
                bit<D_WORDSIZE> operand_a_4_20 = (bit<D_WORDSIZE>) meta.n2n_4_weight_20;
                bit<D_WORDSIZE> operand_a_4_21 = (bit<D_WORDSIZE>) meta.n2n_4_weight_21;
                bit<D_WORDSIZE> operand_a_4_22 = (bit<D_WORDSIZE>) meta.n2n_4_weight_22;
                bit<D_WORDSIZE> operand_a_4_23 = (bit<D_WORDSIZE>) meta.n2n_4_weight_23;
                bit<D_WORDSIZE> operand_a_4_24 = (bit<D_WORDSIZE>) meta.n2n_4_weight_24;
                bit<D_WORDSIZE> operand_a_4_25 = (bit<D_WORDSIZE>) meta.n2n_4_weight_25;
                bit<D_WORDSIZE> operand_a_4_26 = (bit<D_WORDSIZE>) meta.n2n_4_weight_26;
                bit<D_WORDSIZE> operand_a_4_27 = (bit<D_WORDSIZE>) meta.n2n_4_weight_27;
                bit<D_WORDSIZE> operand_a_4_28 = (bit<D_WORDSIZE>) meta.n2n_4_weight_28;
                bit<D_WORDSIZE> operand_a_4_29 = (bit<D_WORDSIZE>) meta.n2n_4_weight_29;
                bit<D_WORDSIZE> operand_a_4_30 = (bit<D_WORDSIZE>) meta.n2n_4_weight_30;
                bit<D_WORDSIZE> operand_a_4_31 = (bit<D_WORDSIZE>) meta.n2n_4_weight_31;
                bit<D_WORDSIZE> operand_a_4_32 = (bit<D_WORDSIZE>) meta.n2n_4_weight_32;
                // Sign extension
                if((operand_a_4_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_1;
                }
                if((operand_a_4_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_2;
                }
                if((operand_a_4_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_3;
                }
                if((operand_a_4_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_4;
                }
                if((operand_a_4_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_5;
                }
                if((operand_a_4_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_6;
                }
                if((operand_a_4_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_7;
                }
                if((operand_a_4_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_8;
                }
                if((operand_a_4_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_9;
                }
                if((operand_a_4_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_10;
                }
                if((operand_a_4_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_11;
                }
                if((operand_a_4_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_12;
                }
                if((operand_a_4_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_13;
                }
                if((operand_a_4_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_14;
                }
                if((operand_a_4_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_15;
                }
                if((operand_a_4_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_16;
                }
                if((operand_a_4_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_17;
                }
                if((operand_a_4_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_18;
                }
                if((operand_a_4_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_19;
                }
                if((operand_a_4_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_20;
                }
                if((operand_a_4_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_21;
                }
                if((operand_a_4_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_22;
                }
                if((operand_a_4_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_23;
                }
                if((operand_a_4_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_24;
                }
                if((operand_a_4_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_25;
                }
                if((operand_a_4_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_26;
                }
                if((operand_a_4_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_27;
                }
                if((operand_a_4_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_28;
                }
                if((operand_a_4_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_29;
                }
                if((operand_a_4_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_30;
                }
                if((operand_a_4_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_31;
                }
                if((operand_a_4_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_4_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_4_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_4_1 = ((operand_a_4_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_4_2 = ((operand_a_4_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_4_3 = ((operand_a_4_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_4_4 = ((operand_a_4_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_4_5 = ((operand_a_4_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_4_6 = ((operand_a_4_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_4_7 = ((operand_a_4_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_4_8 = ((operand_a_4_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_4_9 = ((operand_a_4_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_4_10 = ((operand_a_4_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_4_11 = ((operand_a_4_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_4_12 = ((operand_a_4_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_4_13 = ((operand_a_4_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_4_14 = ((operand_a_4_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_4_15 = ((operand_a_4_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_4_16 = ((operand_a_4_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_4_17 = ((operand_a_4_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_4_18 = ((operand_a_4_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_4_19 = ((operand_a_4_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_4_20 = ((operand_a_4_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_4_21 = ((operand_a_4_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_4_22 = ((operand_a_4_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_4_23 = ((operand_a_4_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_4_24 = ((operand_a_4_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_4_25 = ((operand_a_4_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_4_26 = ((operand_a_4_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_4_27 = ((operand_a_4_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_4_28 = ((operand_a_4_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_4_29 = ((operand_a_4_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_4_30 = ((operand_a_4_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_4_31 = ((operand_a_4_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_4_32 = ((operand_a_4_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_4_data = meta.neuron_4_data + (bit<WORDSIZE>) res_4_1 + (bit<WORDSIZE>) res_4_2 + (bit<WORDSIZE>) res_4_3 + (bit<WORDSIZE>) res_4_4 + (bit<WORDSIZE>) res_4_5 + (bit<WORDSIZE>) res_4_6 + (bit<WORDSIZE>) res_4_7 + (bit<WORDSIZE>) res_4_8 + (bit<WORDSIZE>) res_4_9 + (bit<WORDSIZE>) res_4_10 + (bit<WORDSIZE>) res_4_11 + (bit<WORDSIZE>) res_4_12 + (bit<WORDSIZE>) res_4_13 + (bit<WORDSIZE>) res_4_14 + (bit<WORDSIZE>) res_4_15 + (bit<WORDSIZE>) res_4_16 + (bit<WORDSIZE>) res_4_17 + (bit<WORDSIZE>) res_4_18 + (bit<WORDSIZE>) res_4_19 + (bit<WORDSIZE>) res_4_20 + (bit<WORDSIZE>) res_4_21 + (bit<WORDSIZE>) res_4_22 + (bit<WORDSIZE>) res_4_23 + (bit<WORDSIZE>) res_4_24 + (bit<WORDSIZE>) res_4_25 + (bit<WORDSIZE>) res_4_26 + (bit<WORDSIZE>) res_4_27 + (bit<WORDSIZE>) res_4_28 + (bit<WORDSIZE>) res_4_29 + (bit<WORDSIZE>) res_4_30 + (bit<WORDSIZE>) res_4_31 + (bit<WORDSIZE>) res_4_32;
                // Store data to be fowarded
                reg_neuron_4_data.write(0, meta.neuron_4_data);

                // Neuron 5:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_5_1 = (bit<D_WORDSIZE>) meta.n2n_5_weight_1;
                bit<D_WORDSIZE> operand_a_5_2 = (bit<D_WORDSIZE>) meta.n2n_5_weight_2;
                bit<D_WORDSIZE> operand_a_5_3 = (bit<D_WORDSIZE>) meta.n2n_5_weight_3;
                bit<D_WORDSIZE> operand_a_5_4 = (bit<D_WORDSIZE>) meta.n2n_5_weight_4;
                bit<D_WORDSIZE> operand_a_5_5 = (bit<D_WORDSIZE>) meta.n2n_5_weight_5;
                bit<D_WORDSIZE> operand_a_5_6 = (bit<D_WORDSIZE>) meta.n2n_5_weight_6;
                bit<D_WORDSIZE> operand_a_5_7 = (bit<D_WORDSIZE>) meta.n2n_5_weight_7;
                bit<D_WORDSIZE> operand_a_5_8 = (bit<D_WORDSIZE>) meta.n2n_5_weight_8;
                bit<D_WORDSIZE> operand_a_5_9 = (bit<D_WORDSIZE>) meta.n2n_5_weight_9;
                bit<D_WORDSIZE> operand_a_5_10 = (bit<D_WORDSIZE>) meta.n2n_5_weight_10;
                bit<D_WORDSIZE> operand_a_5_11 = (bit<D_WORDSIZE>) meta.n2n_5_weight_11;
                bit<D_WORDSIZE> operand_a_5_12 = (bit<D_WORDSIZE>) meta.n2n_5_weight_12;
                bit<D_WORDSIZE> operand_a_5_13 = (bit<D_WORDSIZE>) meta.n2n_5_weight_13;
                bit<D_WORDSIZE> operand_a_5_14 = (bit<D_WORDSIZE>) meta.n2n_5_weight_14;
                bit<D_WORDSIZE> operand_a_5_15 = (bit<D_WORDSIZE>) meta.n2n_5_weight_15;
                bit<D_WORDSIZE> operand_a_5_16 = (bit<D_WORDSIZE>) meta.n2n_5_weight_16;
                bit<D_WORDSIZE> operand_a_5_17 = (bit<D_WORDSIZE>) meta.n2n_5_weight_17;
                bit<D_WORDSIZE> operand_a_5_18 = (bit<D_WORDSIZE>) meta.n2n_5_weight_18;
                bit<D_WORDSIZE> operand_a_5_19 = (bit<D_WORDSIZE>) meta.n2n_5_weight_19;
                bit<D_WORDSIZE> operand_a_5_20 = (bit<D_WORDSIZE>) meta.n2n_5_weight_20;
                bit<D_WORDSIZE> operand_a_5_21 = (bit<D_WORDSIZE>) meta.n2n_5_weight_21;
                bit<D_WORDSIZE> operand_a_5_22 = (bit<D_WORDSIZE>) meta.n2n_5_weight_22;
                bit<D_WORDSIZE> operand_a_5_23 = (bit<D_WORDSIZE>) meta.n2n_5_weight_23;
                bit<D_WORDSIZE> operand_a_5_24 = (bit<D_WORDSIZE>) meta.n2n_5_weight_24;
                bit<D_WORDSIZE> operand_a_5_25 = (bit<D_WORDSIZE>) meta.n2n_5_weight_25;
                bit<D_WORDSIZE> operand_a_5_26 = (bit<D_WORDSIZE>) meta.n2n_5_weight_26;
                bit<D_WORDSIZE> operand_a_5_27 = (bit<D_WORDSIZE>) meta.n2n_5_weight_27;
                bit<D_WORDSIZE> operand_a_5_28 = (bit<D_WORDSIZE>) meta.n2n_5_weight_28;
                bit<D_WORDSIZE> operand_a_5_29 = (bit<D_WORDSIZE>) meta.n2n_5_weight_29;
                bit<D_WORDSIZE> operand_a_5_30 = (bit<D_WORDSIZE>) meta.n2n_5_weight_30;
                bit<D_WORDSIZE> operand_a_5_31 = (bit<D_WORDSIZE>) meta.n2n_5_weight_31;
                bit<D_WORDSIZE> operand_a_5_32 = (bit<D_WORDSIZE>) meta.n2n_5_weight_32;
                // Sign extension
                if((operand_a_5_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_1;
                }
                if((operand_a_5_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_2;
                }
                if((operand_a_5_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_3;
                }
                if((operand_a_5_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_4;
                }
                if((operand_a_5_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_5;
                }
                if((operand_a_5_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_6;
                }
                if((operand_a_5_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_7;
                }
                if((operand_a_5_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_8;
                }
                if((operand_a_5_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_9;
                }
                if((operand_a_5_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_10;
                }
                if((operand_a_5_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_11;
                }
                if((operand_a_5_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_12;
                }
                if((operand_a_5_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_13;
                }
                if((operand_a_5_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_14;
                }
                if((operand_a_5_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_15;
                }
                if((operand_a_5_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_16;
                }
                if((operand_a_5_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_17;
                }
                if((operand_a_5_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_18;
                }
                if((operand_a_5_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_19;
                }
                if((operand_a_5_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_20;
                }
                if((operand_a_5_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_21;
                }
                if((operand_a_5_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_22;
                }
                if((operand_a_5_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_23;
                }
                if((operand_a_5_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_24;
                }
                if((operand_a_5_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_25;
                }
                if((operand_a_5_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_26;
                }
                if((operand_a_5_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_27;
                }
                if((operand_a_5_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_28;
                }
                if((operand_a_5_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_29;
                }
                if((operand_a_5_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_30;
                }
                if((operand_a_5_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_31;
                }
                if((operand_a_5_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_5_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_5_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_5_1 = ((operand_a_5_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_5_2 = ((operand_a_5_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_5_3 = ((operand_a_5_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_5_4 = ((operand_a_5_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_5_5 = ((operand_a_5_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_5_6 = ((operand_a_5_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_5_7 = ((operand_a_5_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_5_8 = ((operand_a_5_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_5_9 = ((operand_a_5_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_5_10 = ((operand_a_5_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_5_11 = ((operand_a_5_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_5_12 = ((operand_a_5_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_5_13 = ((operand_a_5_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_5_14 = ((operand_a_5_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_5_15 = ((operand_a_5_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_5_16 = ((operand_a_5_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_5_17 = ((operand_a_5_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_5_18 = ((operand_a_5_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_5_19 = ((operand_a_5_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_5_20 = ((operand_a_5_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_5_21 = ((operand_a_5_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_5_22 = ((operand_a_5_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_5_23 = ((operand_a_5_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_5_24 = ((operand_a_5_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_5_25 = ((operand_a_5_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_5_26 = ((operand_a_5_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_5_27 = ((operand_a_5_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_5_28 = ((operand_a_5_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_5_29 = ((operand_a_5_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_5_30 = ((operand_a_5_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_5_31 = ((operand_a_5_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_5_32 = ((operand_a_5_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_5_data = meta.neuron_5_data + (bit<WORDSIZE>) res_5_1 + (bit<WORDSIZE>) res_5_2 + (bit<WORDSIZE>) res_5_3 + (bit<WORDSIZE>) res_5_4 + (bit<WORDSIZE>) res_5_5 + (bit<WORDSIZE>) res_5_6 + (bit<WORDSIZE>) res_5_7 + (bit<WORDSIZE>) res_5_8 + (bit<WORDSIZE>) res_5_9 + (bit<WORDSIZE>) res_5_10 + (bit<WORDSIZE>) res_5_11 + (bit<WORDSIZE>) res_5_12 + (bit<WORDSIZE>) res_5_13 + (bit<WORDSIZE>) res_5_14 + (bit<WORDSIZE>) res_5_15 + (bit<WORDSIZE>) res_5_16 + (bit<WORDSIZE>) res_5_17 + (bit<WORDSIZE>) res_5_18 + (bit<WORDSIZE>) res_5_19 + (bit<WORDSIZE>) res_5_20 + (bit<WORDSIZE>) res_5_21 + (bit<WORDSIZE>) res_5_22 + (bit<WORDSIZE>) res_5_23 + (bit<WORDSIZE>) res_5_24 + (bit<WORDSIZE>) res_5_25 + (bit<WORDSIZE>) res_5_26 + (bit<WORDSIZE>) res_5_27 + (bit<WORDSIZE>) res_5_28 + (bit<WORDSIZE>) res_5_29 + (bit<WORDSIZE>) res_5_30 + (bit<WORDSIZE>) res_5_31 + (bit<WORDSIZE>) res_5_32;
                // Store data to be fowarded
                reg_neuron_5_data.write(0, meta.neuron_5_data);

                // Neuron 6:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_6_1 = (bit<D_WORDSIZE>) meta.n2n_6_weight_1;
                bit<D_WORDSIZE> operand_a_6_2 = (bit<D_WORDSIZE>) meta.n2n_6_weight_2;
                bit<D_WORDSIZE> operand_a_6_3 = (bit<D_WORDSIZE>) meta.n2n_6_weight_3;
                bit<D_WORDSIZE> operand_a_6_4 = (bit<D_WORDSIZE>) meta.n2n_6_weight_4;
                bit<D_WORDSIZE> operand_a_6_5 = (bit<D_WORDSIZE>) meta.n2n_6_weight_5;
                bit<D_WORDSIZE> operand_a_6_6 = (bit<D_WORDSIZE>) meta.n2n_6_weight_6;
                bit<D_WORDSIZE> operand_a_6_7 = (bit<D_WORDSIZE>) meta.n2n_6_weight_7;
                bit<D_WORDSIZE> operand_a_6_8 = (bit<D_WORDSIZE>) meta.n2n_6_weight_8;
                bit<D_WORDSIZE> operand_a_6_9 = (bit<D_WORDSIZE>) meta.n2n_6_weight_9;
                bit<D_WORDSIZE> operand_a_6_10 = (bit<D_WORDSIZE>) meta.n2n_6_weight_10;
                bit<D_WORDSIZE> operand_a_6_11 = (bit<D_WORDSIZE>) meta.n2n_6_weight_11;
                bit<D_WORDSIZE> operand_a_6_12 = (bit<D_WORDSIZE>) meta.n2n_6_weight_12;
                bit<D_WORDSIZE> operand_a_6_13 = (bit<D_WORDSIZE>) meta.n2n_6_weight_13;
                bit<D_WORDSIZE> operand_a_6_14 = (bit<D_WORDSIZE>) meta.n2n_6_weight_14;
                bit<D_WORDSIZE> operand_a_6_15 = (bit<D_WORDSIZE>) meta.n2n_6_weight_15;
                bit<D_WORDSIZE> operand_a_6_16 = (bit<D_WORDSIZE>) meta.n2n_6_weight_16;
                bit<D_WORDSIZE> operand_a_6_17 = (bit<D_WORDSIZE>) meta.n2n_6_weight_17;
                bit<D_WORDSIZE> operand_a_6_18 = (bit<D_WORDSIZE>) meta.n2n_6_weight_18;
                bit<D_WORDSIZE> operand_a_6_19 = (bit<D_WORDSIZE>) meta.n2n_6_weight_19;
                bit<D_WORDSIZE> operand_a_6_20 = (bit<D_WORDSIZE>) meta.n2n_6_weight_20;
                bit<D_WORDSIZE> operand_a_6_21 = (bit<D_WORDSIZE>) meta.n2n_6_weight_21;
                bit<D_WORDSIZE> operand_a_6_22 = (bit<D_WORDSIZE>) meta.n2n_6_weight_22;
                bit<D_WORDSIZE> operand_a_6_23 = (bit<D_WORDSIZE>) meta.n2n_6_weight_23;
                bit<D_WORDSIZE> operand_a_6_24 = (bit<D_WORDSIZE>) meta.n2n_6_weight_24;
                bit<D_WORDSIZE> operand_a_6_25 = (bit<D_WORDSIZE>) meta.n2n_6_weight_25;
                bit<D_WORDSIZE> operand_a_6_26 = (bit<D_WORDSIZE>) meta.n2n_6_weight_26;
                bit<D_WORDSIZE> operand_a_6_27 = (bit<D_WORDSIZE>) meta.n2n_6_weight_27;
                bit<D_WORDSIZE> operand_a_6_28 = (bit<D_WORDSIZE>) meta.n2n_6_weight_28;
                bit<D_WORDSIZE> operand_a_6_29 = (bit<D_WORDSIZE>) meta.n2n_6_weight_29;
                bit<D_WORDSIZE> operand_a_6_30 = (bit<D_WORDSIZE>) meta.n2n_6_weight_30;
                bit<D_WORDSIZE> operand_a_6_31 = (bit<D_WORDSIZE>) meta.n2n_6_weight_31;
                bit<D_WORDSIZE> operand_a_6_32 = (bit<D_WORDSIZE>) meta.n2n_6_weight_32;
                // Sign extension
                if((operand_a_6_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_1;
                }
                if((operand_a_6_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_2;
                }
                if((operand_a_6_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_3;
                }
                if((operand_a_6_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_4;
                }
                if((operand_a_6_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_5;
                }
                if((operand_a_6_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_6;
                }
                if((operand_a_6_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_7;
                }
                if((operand_a_6_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_8;
                }
                if((operand_a_6_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_9;
                }
                if((operand_a_6_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_10;
                }
                if((operand_a_6_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_11;
                }
                if((operand_a_6_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_12;
                }
                if((operand_a_6_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_13;
                }
                if((operand_a_6_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_14;
                }
                if((operand_a_6_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_15;
                }
                if((operand_a_6_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_16;
                }
                if((operand_a_6_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_17;
                }
                if((operand_a_6_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_18;
                }
                if((operand_a_6_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_19;
                }
                if((operand_a_6_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_20;
                }
                if((operand_a_6_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_21;
                }
                if((operand_a_6_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_22;
                }
                if((operand_a_6_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_23;
                }
                if((operand_a_6_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_24;
                }
                if((operand_a_6_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_25;
                }
                if((operand_a_6_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_26;
                }
                if((operand_a_6_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_27;
                }
                if((operand_a_6_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_28;
                }
                if((operand_a_6_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_29;
                }
                if((operand_a_6_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_30;
                }
                if((operand_a_6_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_31;
                }
                if((operand_a_6_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_6_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_6_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_6_1 = ((operand_a_6_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_6_2 = ((operand_a_6_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_6_3 = ((operand_a_6_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_6_4 = ((operand_a_6_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_6_5 = ((operand_a_6_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_6_6 = ((operand_a_6_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_6_7 = ((operand_a_6_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_6_8 = ((operand_a_6_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_6_9 = ((operand_a_6_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_6_10 = ((operand_a_6_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_6_11 = ((operand_a_6_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_6_12 = ((operand_a_6_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_6_13 = ((operand_a_6_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_6_14 = ((operand_a_6_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_6_15 = ((operand_a_6_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_6_16 = ((operand_a_6_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_6_17 = ((operand_a_6_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_6_18 = ((operand_a_6_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_6_19 = ((operand_a_6_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_6_20 = ((operand_a_6_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_6_21 = ((operand_a_6_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_6_22 = ((operand_a_6_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_6_23 = ((operand_a_6_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_6_24 = ((operand_a_6_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_6_25 = ((operand_a_6_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_6_26 = ((operand_a_6_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_6_27 = ((operand_a_6_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_6_28 = ((operand_a_6_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_6_29 = ((operand_a_6_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_6_30 = ((operand_a_6_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_6_31 = ((operand_a_6_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_6_32 = ((operand_a_6_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_6_data = meta.neuron_6_data + (bit<WORDSIZE>) res_6_1 + (bit<WORDSIZE>) res_6_2 + (bit<WORDSIZE>) res_6_3 + (bit<WORDSIZE>) res_6_4 + (bit<WORDSIZE>) res_6_5 + (bit<WORDSIZE>) res_6_6 + (bit<WORDSIZE>) res_6_7 + (bit<WORDSIZE>) res_6_8 + (bit<WORDSIZE>) res_6_9 + (bit<WORDSIZE>) res_6_10 + (bit<WORDSIZE>) res_6_11 + (bit<WORDSIZE>) res_6_12 + (bit<WORDSIZE>) res_6_13 + (bit<WORDSIZE>) res_6_14 + (bit<WORDSIZE>) res_6_15 + (bit<WORDSIZE>) res_6_16 + (bit<WORDSIZE>) res_6_17 + (bit<WORDSIZE>) res_6_18 + (bit<WORDSIZE>) res_6_19 + (bit<WORDSIZE>) res_6_20 + (bit<WORDSIZE>) res_6_21 + (bit<WORDSIZE>) res_6_22 + (bit<WORDSIZE>) res_6_23 + (bit<WORDSIZE>) res_6_24 + (bit<WORDSIZE>) res_6_25 + (bit<WORDSIZE>) res_6_26 + (bit<WORDSIZE>) res_6_27 + (bit<WORDSIZE>) res_6_28 + (bit<WORDSIZE>) res_6_29 + (bit<WORDSIZE>) res_6_30 + (bit<WORDSIZE>) res_6_31 + (bit<WORDSIZE>) res_6_32;
                // Store data to be fowarded
                reg_neuron_6_data.write(0, meta.neuron_6_data);

                // Neuron 7:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_7_1 = (bit<D_WORDSIZE>) meta.n2n_7_weight_1;
                bit<D_WORDSIZE> operand_a_7_2 = (bit<D_WORDSIZE>) meta.n2n_7_weight_2;
                bit<D_WORDSIZE> operand_a_7_3 = (bit<D_WORDSIZE>) meta.n2n_7_weight_3;
                bit<D_WORDSIZE> operand_a_7_4 = (bit<D_WORDSIZE>) meta.n2n_7_weight_4;
                bit<D_WORDSIZE> operand_a_7_5 = (bit<D_WORDSIZE>) meta.n2n_7_weight_5;
                bit<D_WORDSIZE> operand_a_7_6 = (bit<D_WORDSIZE>) meta.n2n_7_weight_6;
                bit<D_WORDSIZE> operand_a_7_7 = (bit<D_WORDSIZE>) meta.n2n_7_weight_7;
                bit<D_WORDSIZE> operand_a_7_8 = (bit<D_WORDSIZE>) meta.n2n_7_weight_8;
                bit<D_WORDSIZE> operand_a_7_9 = (bit<D_WORDSIZE>) meta.n2n_7_weight_9;
                bit<D_WORDSIZE> operand_a_7_10 = (bit<D_WORDSIZE>) meta.n2n_7_weight_10;
                bit<D_WORDSIZE> operand_a_7_11 = (bit<D_WORDSIZE>) meta.n2n_7_weight_11;
                bit<D_WORDSIZE> operand_a_7_12 = (bit<D_WORDSIZE>) meta.n2n_7_weight_12;
                bit<D_WORDSIZE> operand_a_7_13 = (bit<D_WORDSIZE>) meta.n2n_7_weight_13;
                bit<D_WORDSIZE> operand_a_7_14 = (bit<D_WORDSIZE>) meta.n2n_7_weight_14;
                bit<D_WORDSIZE> operand_a_7_15 = (bit<D_WORDSIZE>) meta.n2n_7_weight_15;
                bit<D_WORDSIZE> operand_a_7_16 = (bit<D_WORDSIZE>) meta.n2n_7_weight_16;
                bit<D_WORDSIZE> operand_a_7_17 = (bit<D_WORDSIZE>) meta.n2n_7_weight_17;
                bit<D_WORDSIZE> operand_a_7_18 = (bit<D_WORDSIZE>) meta.n2n_7_weight_18;
                bit<D_WORDSIZE> operand_a_7_19 = (bit<D_WORDSIZE>) meta.n2n_7_weight_19;
                bit<D_WORDSIZE> operand_a_7_20 = (bit<D_WORDSIZE>) meta.n2n_7_weight_20;
                bit<D_WORDSIZE> operand_a_7_21 = (bit<D_WORDSIZE>) meta.n2n_7_weight_21;
                bit<D_WORDSIZE> operand_a_7_22 = (bit<D_WORDSIZE>) meta.n2n_7_weight_22;
                bit<D_WORDSIZE> operand_a_7_23 = (bit<D_WORDSIZE>) meta.n2n_7_weight_23;
                bit<D_WORDSIZE> operand_a_7_24 = (bit<D_WORDSIZE>) meta.n2n_7_weight_24;
                bit<D_WORDSIZE> operand_a_7_25 = (bit<D_WORDSIZE>) meta.n2n_7_weight_25;
                bit<D_WORDSIZE> operand_a_7_26 = (bit<D_WORDSIZE>) meta.n2n_7_weight_26;
                bit<D_WORDSIZE> operand_a_7_27 = (bit<D_WORDSIZE>) meta.n2n_7_weight_27;
                bit<D_WORDSIZE> operand_a_7_28 = (bit<D_WORDSIZE>) meta.n2n_7_weight_28;
                bit<D_WORDSIZE> operand_a_7_29 = (bit<D_WORDSIZE>) meta.n2n_7_weight_29;
                bit<D_WORDSIZE> operand_a_7_30 = (bit<D_WORDSIZE>) meta.n2n_7_weight_30;
                bit<D_WORDSIZE> operand_a_7_31 = (bit<D_WORDSIZE>) meta.n2n_7_weight_31;
                bit<D_WORDSIZE> operand_a_7_32 = (bit<D_WORDSIZE>) meta.n2n_7_weight_32;
                // Sign extension
                if((operand_a_7_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_1;
                }
                if((operand_a_7_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_2;
                }
                if((operand_a_7_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_3;
                }
                if((operand_a_7_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_4;
                }
                if((operand_a_7_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_5;
                }
                if((operand_a_7_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_6;
                }
                if((operand_a_7_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_7;
                }
                if((operand_a_7_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_8;
                }
                if((operand_a_7_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_9;
                }
                if((operand_a_7_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_10;
                }
                if((operand_a_7_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_11;
                }
                if((operand_a_7_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_12;
                }
                if((operand_a_7_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_13;
                }
                if((operand_a_7_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_14;
                }
                if((operand_a_7_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_15;
                }
                if((operand_a_7_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_16;
                }
                if((operand_a_7_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_17;
                }
                if((operand_a_7_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_18;
                }
                if((operand_a_7_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_19;
                }
                if((operand_a_7_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_20;
                }
                if((operand_a_7_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_21;
                }
                if((operand_a_7_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_22;
                }
                if((operand_a_7_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_23;
                }
                if((operand_a_7_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_24;
                }
                if((operand_a_7_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_25;
                }
                if((operand_a_7_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_26;
                }
                if((operand_a_7_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_27;
                }
                if((operand_a_7_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_28;
                }
                if((operand_a_7_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_29;
                }
                if((operand_a_7_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_30;
                }
                if((operand_a_7_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_31;
                }
                if((operand_a_7_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_7_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_7_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_7_1 = ((operand_a_7_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_7_2 = ((operand_a_7_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_7_3 = ((operand_a_7_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_7_4 = ((operand_a_7_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_7_5 = ((operand_a_7_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_7_6 = ((operand_a_7_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_7_7 = ((operand_a_7_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_7_8 = ((operand_a_7_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_7_9 = ((operand_a_7_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_7_10 = ((operand_a_7_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_7_11 = ((operand_a_7_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_7_12 = ((operand_a_7_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_7_13 = ((operand_a_7_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_7_14 = ((operand_a_7_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_7_15 = ((operand_a_7_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_7_16 = ((operand_a_7_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_7_17 = ((operand_a_7_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_7_18 = ((operand_a_7_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_7_19 = ((operand_a_7_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_7_20 = ((operand_a_7_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_7_21 = ((operand_a_7_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_7_22 = ((operand_a_7_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_7_23 = ((operand_a_7_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_7_24 = ((operand_a_7_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_7_25 = ((operand_a_7_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_7_26 = ((operand_a_7_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_7_27 = ((operand_a_7_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_7_28 = ((operand_a_7_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_7_29 = ((operand_a_7_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_7_30 = ((operand_a_7_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_7_31 = ((operand_a_7_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_7_32 = ((operand_a_7_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_7_data = meta.neuron_7_data + (bit<WORDSIZE>) res_7_1 + (bit<WORDSIZE>) res_7_2 + (bit<WORDSIZE>) res_7_3 + (bit<WORDSIZE>) res_7_4 + (bit<WORDSIZE>) res_7_5 + (bit<WORDSIZE>) res_7_6 + (bit<WORDSIZE>) res_7_7 + (bit<WORDSIZE>) res_7_8 + (bit<WORDSIZE>) res_7_9 + (bit<WORDSIZE>) res_7_10 + (bit<WORDSIZE>) res_7_11 + (bit<WORDSIZE>) res_7_12 + (bit<WORDSIZE>) res_7_13 + (bit<WORDSIZE>) res_7_14 + (bit<WORDSIZE>) res_7_15 + (bit<WORDSIZE>) res_7_16 + (bit<WORDSIZE>) res_7_17 + (bit<WORDSIZE>) res_7_18 + (bit<WORDSIZE>) res_7_19 + (bit<WORDSIZE>) res_7_20 + (bit<WORDSIZE>) res_7_21 + (bit<WORDSIZE>) res_7_22 + (bit<WORDSIZE>) res_7_23 + (bit<WORDSIZE>) res_7_24 + (bit<WORDSIZE>) res_7_25 + (bit<WORDSIZE>) res_7_26 + (bit<WORDSIZE>) res_7_27 + (bit<WORDSIZE>) res_7_28 + (bit<WORDSIZE>) res_7_29 + (bit<WORDSIZE>) res_7_30 + (bit<WORDSIZE>) res_7_31 + (bit<WORDSIZE>) res_7_32;
                // Store data to be fowarded
                reg_neuron_7_data.write(0, meta.neuron_7_data);

                // Neuron 8:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_8_1 = (bit<D_WORDSIZE>) meta.n2n_8_weight_1;
                bit<D_WORDSIZE> operand_a_8_2 = (bit<D_WORDSIZE>) meta.n2n_8_weight_2;
                bit<D_WORDSIZE> operand_a_8_3 = (bit<D_WORDSIZE>) meta.n2n_8_weight_3;
                bit<D_WORDSIZE> operand_a_8_4 = (bit<D_WORDSIZE>) meta.n2n_8_weight_4;
                bit<D_WORDSIZE> operand_a_8_5 = (bit<D_WORDSIZE>) meta.n2n_8_weight_5;
                bit<D_WORDSIZE> operand_a_8_6 = (bit<D_WORDSIZE>) meta.n2n_8_weight_6;
                bit<D_WORDSIZE> operand_a_8_7 = (bit<D_WORDSIZE>) meta.n2n_8_weight_7;
                bit<D_WORDSIZE> operand_a_8_8 = (bit<D_WORDSIZE>) meta.n2n_8_weight_8;
                bit<D_WORDSIZE> operand_a_8_9 = (bit<D_WORDSIZE>) meta.n2n_8_weight_9;
                bit<D_WORDSIZE> operand_a_8_10 = (bit<D_WORDSIZE>) meta.n2n_8_weight_10;
                bit<D_WORDSIZE> operand_a_8_11 = (bit<D_WORDSIZE>) meta.n2n_8_weight_11;
                bit<D_WORDSIZE> operand_a_8_12 = (bit<D_WORDSIZE>) meta.n2n_8_weight_12;
                bit<D_WORDSIZE> operand_a_8_13 = (bit<D_WORDSIZE>) meta.n2n_8_weight_13;
                bit<D_WORDSIZE> operand_a_8_14 = (bit<D_WORDSIZE>) meta.n2n_8_weight_14;
                bit<D_WORDSIZE> operand_a_8_15 = (bit<D_WORDSIZE>) meta.n2n_8_weight_15;
                bit<D_WORDSIZE> operand_a_8_16 = (bit<D_WORDSIZE>) meta.n2n_8_weight_16;
                bit<D_WORDSIZE> operand_a_8_17 = (bit<D_WORDSIZE>) meta.n2n_8_weight_17;
                bit<D_WORDSIZE> operand_a_8_18 = (bit<D_WORDSIZE>) meta.n2n_8_weight_18;
                bit<D_WORDSIZE> operand_a_8_19 = (bit<D_WORDSIZE>) meta.n2n_8_weight_19;
                bit<D_WORDSIZE> operand_a_8_20 = (bit<D_WORDSIZE>) meta.n2n_8_weight_20;
                bit<D_WORDSIZE> operand_a_8_21 = (bit<D_WORDSIZE>) meta.n2n_8_weight_21;
                bit<D_WORDSIZE> operand_a_8_22 = (bit<D_WORDSIZE>) meta.n2n_8_weight_22;
                bit<D_WORDSIZE> operand_a_8_23 = (bit<D_WORDSIZE>) meta.n2n_8_weight_23;
                bit<D_WORDSIZE> operand_a_8_24 = (bit<D_WORDSIZE>) meta.n2n_8_weight_24;
                bit<D_WORDSIZE> operand_a_8_25 = (bit<D_WORDSIZE>) meta.n2n_8_weight_25;
                bit<D_WORDSIZE> operand_a_8_26 = (bit<D_WORDSIZE>) meta.n2n_8_weight_26;
                bit<D_WORDSIZE> operand_a_8_27 = (bit<D_WORDSIZE>) meta.n2n_8_weight_27;
                bit<D_WORDSIZE> operand_a_8_28 = (bit<D_WORDSIZE>) meta.n2n_8_weight_28;
                bit<D_WORDSIZE> operand_a_8_29 = (bit<D_WORDSIZE>) meta.n2n_8_weight_29;
                bit<D_WORDSIZE> operand_a_8_30 = (bit<D_WORDSIZE>) meta.n2n_8_weight_30;
                bit<D_WORDSIZE> operand_a_8_31 = (bit<D_WORDSIZE>) meta.n2n_8_weight_31;
                bit<D_WORDSIZE> operand_a_8_32 = (bit<D_WORDSIZE>) meta.n2n_8_weight_32;
                // Sign extension
                if((operand_a_8_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_1;
                }
                if((operand_a_8_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_2;
                }
                if((operand_a_8_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_3;
                }
                if((operand_a_8_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_4;
                }
                if((operand_a_8_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_5;
                }
                if((operand_a_8_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_6;
                }
                if((operand_a_8_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_7;
                }
                if((operand_a_8_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_8;
                }
                if((operand_a_8_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_9;
                }
                if((operand_a_8_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_10;
                }
                if((operand_a_8_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_11;
                }
                if((operand_a_8_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_12;
                }
                if((operand_a_8_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_13;
                }
                if((operand_a_8_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_14;
                }
                if((operand_a_8_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_15;
                }
                if((operand_a_8_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_16;
                }
                if((operand_a_8_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_17;
                }
                if((operand_a_8_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_18;
                }
                if((operand_a_8_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_19;
                }
                if((operand_a_8_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_20;
                }
                if((operand_a_8_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_21;
                }
                if((operand_a_8_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_22;
                }
                if((operand_a_8_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_23;
                }
                if((operand_a_8_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_24;
                }
                if((operand_a_8_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_25;
                }
                if((operand_a_8_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_26;
                }
                if((operand_a_8_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_27;
                }
                if((operand_a_8_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_28;
                }
                if((operand_a_8_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_29;
                }
                if((operand_a_8_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_30;
                }
                if((operand_a_8_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_31;
                }
                if((operand_a_8_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_8_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_8_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_8_1 = ((operand_a_8_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_8_2 = ((operand_a_8_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_8_3 = ((operand_a_8_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_8_4 = ((operand_a_8_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_8_5 = ((operand_a_8_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_8_6 = ((operand_a_8_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_8_7 = ((operand_a_8_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_8_8 = ((operand_a_8_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_8_9 = ((operand_a_8_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_8_10 = ((operand_a_8_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_8_11 = ((operand_a_8_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_8_12 = ((operand_a_8_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_8_13 = ((operand_a_8_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_8_14 = ((operand_a_8_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_8_15 = ((operand_a_8_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_8_16 = ((operand_a_8_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_8_17 = ((operand_a_8_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_8_18 = ((operand_a_8_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_8_19 = ((operand_a_8_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_8_20 = ((operand_a_8_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_8_21 = ((operand_a_8_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_8_22 = ((operand_a_8_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_8_23 = ((operand_a_8_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_8_24 = ((operand_a_8_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_8_25 = ((operand_a_8_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_8_26 = ((operand_a_8_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_8_27 = ((operand_a_8_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_8_28 = ((operand_a_8_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_8_29 = ((operand_a_8_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_8_30 = ((operand_a_8_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_8_31 = ((operand_a_8_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_8_32 = ((operand_a_8_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_8_data = meta.neuron_8_data + (bit<WORDSIZE>) res_8_1 + (bit<WORDSIZE>) res_8_2 + (bit<WORDSIZE>) res_8_3 + (bit<WORDSIZE>) res_8_4 + (bit<WORDSIZE>) res_8_5 + (bit<WORDSIZE>) res_8_6 + (bit<WORDSIZE>) res_8_7 + (bit<WORDSIZE>) res_8_8 + (bit<WORDSIZE>) res_8_9 + (bit<WORDSIZE>) res_8_10 + (bit<WORDSIZE>) res_8_11 + (bit<WORDSIZE>) res_8_12 + (bit<WORDSIZE>) res_8_13 + (bit<WORDSIZE>) res_8_14 + (bit<WORDSIZE>) res_8_15 + (bit<WORDSIZE>) res_8_16 + (bit<WORDSIZE>) res_8_17 + (bit<WORDSIZE>) res_8_18 + (bit<WORDSIZE>) res_8_19 + (bit<WORDSIZE>) res_8_20 + (bit<WORDSIZE>) res_8_21 + (bit<WORDSIZE>) res_8_22 + (bit<WORDSIZE>) res_8_23 + (bit<WORDSIZE>) res_8_24 + (bit<WORDSIZE>) res_8_25 + (bit<WORDSIZE>) res_8_26 + (bit<WORDSIZE>) res_8_27 + (bit<WORDSIZE>) res_8_28 + (bit<WORDSIZE>) res_8_29 + (bit<WORDSIZE>) res_8_30 + (bit<WORDSIZE>) res_8_31 + (bit<WORDSIZE>) res_8_32;
                // Store data to be fowarded
                reg_neuron_8_data.write(0, meta.neuron_8_data);

                // Neuron 9:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_9_1 = (bit<D_WORDSIZE>) meta.n2n_9_weight_1;
                bit<D_WORDSIZE> operand_a_9_2 = (bit<D_WORDSIZE>) meta.n2n_9_weight_2;
                bit<D_WORDSIZE> operand_a_9_3 = (bit<D_WORDSIZE>) meta.n2n_9_weight_3;
                bit<D_WORDSIZE> operand_a_9_4 = (bit<D_WORDSIZE>) meta.n2n_9_weight_4;
                bit<D_WORDSIZE> operand_a_9_5 = (bit<D_WORDSIZE>) meta.n2n_9_weight_5;
                bit<D_WORDSIZE> operand_a_9_6 = (bit<D_WORDSIZE>) meta.n2n_9_weight_6;
                bit<D_WORDSIZE> operand_a_9_7 = (bit<D_WORDSIZE>) meta.n2n_9_weight_7;
                bit<D_WORDSIZE> operand_a_9_8 = (bit<D_WORDSIZE>) meta.n2n_9_weight_8;
                bit<D_WORDSIZE> operand_a_9_9 = (bit<D_WORDSIZE>) meta.n2n_9_weight_9;
                bit<D_WORDSIZE> operand_a_9_10 = (bit<D_WORDSIZE>) meta.n2n_9_weight_10;
                bit<D_WORDSIZE> operand_a_9_11 = (bit<D_WORDSIZE>) meta.n2n_9_weight_11;
                bit<D_WORDSIZE> operand_a_9_12 = (bit<D_WORDSIZE>) meta.n2n_9_weight_12;
                bit<D_WORDSIZE> operand_a_9_13 = (bit<D_WORDSIZE>) meta.n2n_9_weight_13;
                bit<D_WORDSIZE> operand_a_9_14 = (bit<D_WORDSIZE>) meta.n2n_9_weight_14;
                bit<D_WORDSIZE> operand_a_9_15 = (bit<D_WORDSIZE>) meta.n2n_9_weight_15;
                bit<D_WORDSIZE> operand_a_9_16 = (bit<D_WORDSIZE>) meta.n2n_9_weight_16;
                bit<D_WORDSIZE> operand_a_9_17 = (bit<D_WORDSIZE>) meta.n2n_9_weight_17;
                bit<D_WORDSIZE> operand_a_9_18 = (bit<D_WORDSIZE>) meta.n2n_9_weight_18;
                bit<D_WORDSIZE> operand_a_9_19 = (bit<D_WORDSIZE>) meta.n2n_9_weight_19;
                bit<D_WORDSIZE> operand_a_9_20 = (bit<D_WORDSIZE>) meta.n2n_9_weight_20;
                bit<D_WORDSIZE> operand_a_9_21 = (bit<D_WORDSIZE>) meta.n2n_9_weight_21;
                bit<D_WORDSIZE> operand_a_9_22 = (bit<D_WORDSIZE>) meta.n2n_9_weight_22;
                bit<D_WORDSIZE> operand_a_9_23 = (bit<D_WORDSIZE>) meta.n2n_9_weight_23;
                bit<D_WORDSIZE> operand_a_9_24 = (bit<D_WORDSIZE>) meta.n2n_9_weight_24;
                bit<D_WORDSIZE> operand_a_9_25 = (bit<D_WORDSIZE>) meta.n2n_9_weight_25;
                bit<D_WORDSIZE> operand_a_9_26 = (bit<D_WORDSIZE>) meta.n2n_9_weight_26;
                bit<D_WORDSIZE> operand_a_9_27 = (bit<D_WORDSIZE>) meta.n2n_9_weight_27;
                bit<D_WORDSIZE> operand_a_9_28 = (bit<D_WORDSIZE>) meta.n2n_9_weight_28;
                bit<D_WORDSIZE> operand_a_9_29 = (bit<D_WORDSIZE>) meta.n2n_9_weight_29;
                bit<D_WORDSIZE> operand_a_9_30 = (bit<D_WORDSIZE>) meta.n2n_9_weight_30;
                bit<D_WORDSIZE> operand_a_9_31 = (bit<D_WORDSIZE>) meta.n2n_9_weight_31;
                bit<D_WORDSIZE> operand_a_9_32 = (bit<D_WORDSIZE>) meta.n2n_9_weight_32;
                // Sign extension
                if((operand_a_9_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_1;
                }
                if((operand_a_9_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_2;
                }
                if((operand_a_9_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_3;
                }
                if((operand_a_9_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_4;
                }
                if((operand_a_9_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_5;
                }
                if((operand_a_9_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_6;
                }
                if((operand_a_9_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_7;
                }
                if((operand_a_9_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_8;
                }
                if((operand_a_9_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_9;
                }
                if((operand_a_9_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_10;
                }
                if((operand_a_9_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_11;
                }
                if((operand_a_9_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_12;
                }
                if((operand_a_9_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_13;
                }
                if((operand_a_9_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_14;
                }
                if((operand_a_9_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_15;
                }
                if((operand_a_9_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_16;
                }
                if((operand_a_9_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_17;
                }
                if((operand_a_9_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_18;
                }
                if((operand_a_9_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_19;
                }
                if((operand_a_9_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_20;
                }
                if((operand_a_9_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_21;
                }
                if((operand_a_9_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_22;
                }
                if((operand_a_9_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_23;
                }
                if((operand_a_9_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_24;
                }
                if((operand_a_9_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_25;
                }
                if((operand_a_9_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_26;
                }
                if((operand_a_9_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_27;
                }
                if((operand_a_9_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_28;
                }
                if((operand_a_9_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_29;
                }
                if((operand_a_9_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_30;
                }
                if((operand_a_9_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_31;
                }
                if((operand_a_9_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_9_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_9_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_9_1 = ((operand_a_9_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_9_2 = ((operand_a_9_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_9_3 = ((operand_a_9_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_9_4 = ((operand_a_9_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_9_5 = ((operand_a_9_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_9_6 = ((operand_a_9_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_9_7 = ((operand_a_9_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_9_8 = ((operand_a_9_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_9_9 = ((operand_a_9_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_9_10 = ((operand_a_9_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_9_11 = ((operand_a_9_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_9_12 = ((operand_a_9_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_9_13 = ((operand_a_9_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_9_14 = ((operand_a_9_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_9_15 = ((operand_a_9_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_9_16 = ((operand_a_9_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_9_17 = ((operand_a_9_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_9_18 = ((operand_a_9_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_9_19 = ((operand_a_9_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_9_20 = ((operand_a_9_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_9_21 = ((operand_a_9_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_9_22 = ((operand_a_9_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_9_23 = ((operand_a_9_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_9_24 = ((operand_a_9_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_9_25 = ((operand_a_9_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_9_26 = ((operand_a_9_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_9_27 = ((operand_a_9_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_9_28 = ((operand_a_9_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_9_29 = ((operand_a_9_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_9_30 = ((operand_a_9_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_9_31 = ((operand_a_9_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_9_32 = ((operand_a_9_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_9_data = meta.neuron_9_data + (bit<WORDSIZE>) res_9_1 + (bit<WORDSIZE>) res_9_2 + (bit<WORDSIZE>) res_9_3 + (bit<WORDSIZE>) res_9_4 + (bit<WORDSIZE>) res_9_5 + (bit<WORDSIZE>) res_9_6 + (bit<WORDSIZE>) res_9_7 + (bit<WORDSIZE>) res_9_8 + (bit<WORDSIZE>) res_9_9 + (bit<WORDSIZE>) res_9_10 + (bit<WORDSIZE>) res_9_11 + (bit<WORDSIZE>) res_9_12 + (bit<WORDSIZE>) res_9_13 + (bit<WORDSIZE>) res_9_14 + (bit<WORDSIZE>) res_9_15 + (bit<WORDSIZE>) res_9_16 + (bit<WORDSIZE>) res_9_17 + (bit<WORDSIZE>) res_9_18 + (bit<WORDSIZE>) res_9_19 + (bit<WORDSIZE>) res_9_20 + (bit<WORDSIZE>) res_9_21 + (bit<WORDSIZE>) res_9_22 + (bit<WORDSIZE>) res_9_23 + (bit<WORDSIZE>) res_9_24 + (bit<WORDSIZE>) res_9_25 + (bit<WORDSIZE>) res_9_26 + (bit<WORDSIZE>) res_9_27 + (bit<WORDSIZE>) res_9_28 + (bit<WORDSIZE>) res_9_29 + (bit<WORDSIZE>) res_9_30 + (bit<WORDSIZE>) res_9_31 + (bit<WORDSIZE>) res_9_32;
                // Store data to be fowarded
                reg_neuron_9_data.write(0, meta.neuron_9_data);

                // Neuron 10:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_10_1 = (bit<D_WORDSIZE>) meta.n2n_10_weight_1;
                bit<D_WORDSIZE> operand_a_10_2 = (bit<D_WORDSIZE>) meta.n2n_10_weight_2;
                bit<D_WORDSIZE> operand_a_10_3 = (bit<D_WORDSIZE>) meta.n2n_10_weight_3;
                bit<D_WORDSIZE> operand_a_10_4 = (bit<D_WORDSIZE>) meta.n2n_10_weight_4;
                bit<D_WORDSIZE> operand_a_10_5 = (bit<D_WORDSIZE>) meta.n2n_10_weight_5;
                bit<D_WORDSIZE> operand_a_10_6 = (bit<D_WORDSIZE>) meta.n2n_10_weight_6;
                bit<D_WORDSIZE> operand_a_10_7 = (bit<D_WORDSIZE>) meta.n2n_10_weight_7;
                bit<D_WORDSIZE> operand_a_10_8 = (bit<D_WORDSIZE>) meta.n2n_10_weight_8;
                bit<D_WORDSIZE> operand_a_10_9 = (bit<D_WORDSIZE>) meta.n2n_10_weight_9;
                bit<D_WORDSIZE> operand_a_10_10 = (bit<D_WORDSIZE>) meta.n2n_10_weight_10;
                bit<D_WORDSIZE> operand_a_10_11 = (bit<D_WORDSIZE>) meta.n2n_10_weight_11;
                bit<D_WORDSIZE> operand_a_10_12 = (bit<D_WORDSIZE>) meta.n2n_10_weight_12;
                bit<D_WORDSIZE> operand_a_10_13 = (bit<D_WORDSIZE>) meta.n2n_10_weight_13;
                bit<D_WORDSIZE> operand_a_10_14 = (bit<D_WORDSIZE>) meta.n2n_10_weight_14;
                bit<D_WORDSIZE> operand_a_10_15 = (bit<D_WORDSIZE>) meta.n2n_10_weight_15;
                bit<D_WORDSIZE> operand_a_10_16 = (bit<D_WORDSIZE>) meta.n2n_10_weight_16;
                bit<D_WORDSIZE> operand_a_10_17 = (bit<D_WORDSIZE>) meta.n2n_10_weight_17;
                bit<D_WORDSIZE> operand_a_10_18 = (bit<D_WORDSIZE>) meta.n2n_10_weight_18;
                bit<D_WORDSIZE> operand_a_10_19 = (bit<D_WORDSIZE>) meta.n2n_10_weight_19;
                bit<D_WORDSIZE> operand_a_10_20 = (bit<D_WORDSIZE>) meta.n2n_10_weight_20;
                bit<D_WORDSIZE> operand_a_10_21 = (bit<D_WORDSIZE>) meta.n2n_10_weight_21;
                bit<D_WORDSIZE> operand_a_10_22 = (bit<D_WORDSIZE>) meta.n2n_10_weight_22;
                bit<D_WORDSIZE> operand_a_10_23 = (bit<D_WORDSIZE>) meta.n2n_10_weight_23;
                bit<D_WORDSIZE> operand_a_10_24 = (bit<D_WORDSIZE>) meta.n2n_10_weight_24;
                bit<D_WORDSIZE> operand_a_10_25 = (bit<D_WORDSIZE>) meta.n2n_10_weight_25;
                bit<D_WORDSIZE> operand_a_10_26 = (bit<D_WORDSIZE>) meta.n2n_10_weight_26;
                bit<D_WORDSIZE> operand_a_10_27 = (bit<D_WORDSIZE>) meta.n2n_10_weight_27;
                bit<D_WORDSIZE> operand_a_10_28 = (bit<D_WORDSIZE>) meta.n2n_10_weight_28;
                bit<D_WORDSIZE> operand_a_10_29 = (bit<D_WORDSIZE>) meta.n2n_10_weight_29;
                bit<D_WORDSIZE> operand_a_10_30 = (bit<D_WORDSIZE>) meta.n2n_10_weight_30;
                bit<D_WORDSIZE> operand_a_10_31 = (bit<D_WORDSIZE>) meta.n2n_10_weight_31;
                bit<D_WORDSIZE> operand_a_10_32 = (bit<D_WORDSIZE>) meta.n2n_10_weight_32;
                // Sign extension
                if((operand_a_10_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_1;
                }
                if((operand_a_10_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_2;
                }
                if((operand_a_10_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_3;
                }
                if((operand_a_10_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_4;
                }
                if((operand_a_10_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_5;
                }
                if((operand_a_10_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_6;
                }
                if((operand_a_10_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_7;
                }
                if((operand_a_10_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_8;
                }
                if((operand_a_10_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_9;
                }
                if((operand_a_10_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_10;
                }
                if((operand_a_10_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_11;
                }
                if((operand_a_10_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_12;
                }
                if((operand_a_10_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_13;
                }
                if((operand_a_10_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_14;
                }
                if((operand_a_10_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_15;
                }
                if((operand_a_10_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_16;
                }
                if((operand_a_10_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_17;
                }
                if((operand_a_10_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_18;
                }
                if((operand_a_10_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_19;
                }
                if((operand_a_10_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_20;
                }
                if((operand_a_10_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_21;
                }
                if((operand_a_10_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_22;
                }
                if((operand_a_10_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_23;
                }
                if((operand_a_10_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_24;
                }
                if((operand_a_10_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_25;
                }
                if((operand_a_10_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_26;
                }
                if((operand_a_10_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_27;
                }
                if((operand_a_10_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_28;
                }
                if((operand_a_10_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_29;
                }
                if((operand_a_10_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_30;
                }
                if((operand_a_10_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_31;
                }
                if((operand_a_10_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_10_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_10_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_10_1 = ((operand_a_10_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_10_2 = ((operand_a_10_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_10_3 = ((operand_a_10_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_10_4 = ((operand_a_10_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_10_5 = ((operand_a_10_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_10_6 = ((operand_a_10_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_10_7 = ((operand_a_10_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_10_8 = ((operand_a_10_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_10_9 = ((operand_a_10_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_10_10 = ((operand_a_10_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_10_11 = ((operand_a_10_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_10_12 = ((operand_a_10_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_10_13 = ((operand_a_10_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_10_14 = ((operand_a_10_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_10_15 = ((operand_a_10_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_10_16 = ((operand_a_10_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_10_17 = ((operand_a_10_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_10_18 = ((operand_a_10_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_10_19 = ((operand_a_10_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_10_20 = ((operand_a_10_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_10_21 = ((operand_a_10_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_10_22 = ((operand_a_10_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_10_23 = ((operand_a_10_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_10_24 = ((operand_a_10_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_10_25 = ((operand_a_10_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_10_26 = ((operand_a_10_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_10_27 = ((operand_a_10_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_10_28 = ((operand_a_10_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_10_29 = ((operand_a_10_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_10_30 = ((operand_a_10_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_10_31 = ((operand_a_10_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_10_32 = ((operand_a_10_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_10_data = meta.neuron_10_data + (bit<WORDSIZE>) res_10_1 + (bit<WORDSIZE>) res_10_2 + (bit<WORDSIZE>) res_10_3 + (bit<WORDSIZE>) res_10_4 + (bit<WORDSIZE>) res_10_5 + (bit<WORDSIZE>) res_10_6 + (bit<WORDSIZE>) res_10_7 + (bit<WORDSIZE>) res_10_8 + (bit<WORDSIZE>) res_10_9 + (bit<WORDSIZE>) res_10_10 + (bit<WORDSIZE>) res_10_11 + (bit<WORDSIZE>) res_10_12 + (bit<WORDSIZE>) res_10_13 + (bit<WORDSIZE>) res_10_14 + (bit<WORDSIZE>) res_10_15 + (bit<WORDSIZE>) res_10_16 + (bit<WORDSIZE>) res_10_17 + (bit<WORDSIZE>) res_10_18 + (bit<WORDSIZE>) res_10_19 + (bit<WORDSIZE>) res_10_20 + (bit<WORDSIZE>) res_10_21 + (bit<WORDSIZE>) res_10_22 + (bit<WORDSIZE>) res_10_23 + (bit<WORDSIZE>) res_10_24 + (bit<WORDSIZE>) res_10_25 + (bit<WORDSIZE>) res_10_26 + (bit<WORDSIZE>) res_10_27 + (bit<WORDSIZE>) res_10_28 + (bit<WORDSIZE>) res_10_29 + (bit<WORDSIZE>) res_10_30 + (bit<WORDSIZE>) res_10_31 + (bit<WORDSIZE>) res_10_32;
                // Store data to be fowarded
                reg_neuron_10_data.write(0, meta.neuron_10_data);

                // Neuron 11:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_11_1 = (bit<D_WORDSIZE>) meta.n2n_11_weight_1;
                bit<D_WORDSIZE> operand_a_11_2 = (bit<D_WORDSIZE>) meta.n2n_11_weight_2;
                bit<D_WORDSIZE> operand_a_11_3 = (bit<D_WORDSIZE>) meta.n2n_11_weight_3;
                bit<D_WORDSIZE> operand_a_11_4 = (bit<D_WORDSIZE>) meta.n2n_11_weight_4;
                bit<D_WORDSIZE> operand_a_11_5 = (bit<D_WORDSIZE>) meta.n2n_11_weight_5;
                bit<D_WORDSIZE> operand_a_11_6 = (bit<D_WORDSIZE>) meta.n2n_11_weight_6;
                bit<D_WORDSIZE> operand_a_11_7 = (bit<D_WORDSIZE>) meta.n2n_11_weight_7;
                bit<D_WORDSIZE> operand_a_11_8 = (bit<D_WORDSIZE>) meta.n2n_11_weight_8;
                bit<D_WORDSIZE> operand_a_11_9 = (bit<D_WORDSIZE>) meta.n2n_11_weight_9;
                bit<D_WORDSIZE> operand_a_11_10 = (bit<D_WORDSIZE>) meta.n2n_11_weight_10;
                bit<D_WORDSIZE> operand_a_11_11 = (bit<D_WORDSIZE>) meta.n2n_11_weight_11;
                bit<D_WORDSIZE> operand_a_11_12 = (bit<D_WORDSIZE>) meta.n2n_11_weight_12;
                bit<D_WORDSIZE> operand_a_11_13 = (bit<D_WORDSIZE>) meta.n2n_11_weight_13;
                bit<D_WORDSIZE> operand_a_11_14 = (bit<D_WORDSIZE>) meta.n2n_11_weight_14;
                bit<D_WORDSIZE> operand_a_11_15 = (bit<D_WORDSIZE>) meta.n2n_11_weight_15;
                bit<D_WORDSIZE> operand_a_11_16 = (bit<D_WORDSIZE>) meta.n2n_11_weight_16;
                bit<D_WORDSIZE> operand_a_11_17 = (bit<D_WORDSIZE>) meta.n2n_11_weight_17;
                bit<D_WORDSIZE> operand_a_11_18 = (bit<D_WORDSIZE>) meta.n2n_11_weight_18;
                bit<D_WORDSIZE> operand_a_11_19 = (bit<D_WORDSIZE>) meta.n2n_11_weight_19;
                bit<D_WORDSIZE> operand_a_11_20 = (bit<D_WORDSIZE>) meta.n2n_11_weight_20;
                bit<D_WORDSIZE> operand_a_11_21 = (bit<D_WORDSIZE>) meta.n2n_11_weight_21;
                bit<D_WORDSIZE> operand_a_11_22 = (bit<D_WORDSIZE>) meta.n2n_11_weight_22;
                bit<D_WORDSIZE> operand_a_11_23 = (bit<D_WORDSIZE>) meta.n2n_11_weight_23;
                bit<D_WORDSIZE> operand_a_11_24 = (bit<D_WORDSIZE>) meta.n2n_11_weight_24;
                bit<D_WORDSIZE> operand_a_11_25 = (bit<D_WORDSIZE>) meta.n2n_11_weight_25;
                bit<D_WORDSIZE> operand_a_11_26 = (bit<D_WORDSIZE>) meta.n2n_11_weight_26;
                bit<D_WORDSIZE> operand_a_11_27 = (bit<D_WORDSIZE>) meta.n2n_11_weight_27;
                bit<D_WORDSIZE> operand_a_11_28 = (bit<D_WORDSIZE>) meta.n2n_11_weight_28;
                bit<D_WORDSIZE> operand_a_11_29 = (bit<D_WORDSIZE>) meta.n2n_11_weight_29;
                bit<D_WORDSIZE> operand_a_11_30 = (bit<D_WORDSIZE>) meta.n2n_11_weight_30;
                bit<D_WORDSIZE> operand_a_11_31 = (bit<D_WORDSIZE>) meta.n2n_11_weight_31;
                bit<D_WORDSIZE> operand_a_11_32 = (bit<D_WORDSIZE>) meta.n2n_11_weight_32;
                // Sign extension
                if((operand_a_11_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_1;
                }
                if((operand_a_11_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_2;
                }
                if((operand_a_11_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_3;
                }
                if((operand_a_11_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_4;
                }
                if((operand_a_11_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_5;
                }
                if((operand_a_11_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_6;
                }
                if((operand_a_11_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_7;
                }
                if((operand_a_11_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_8;
                }
                if((operand_a_11_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_9;
                }
                if((operand_a_11_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_10;
                }
                if((operand_a_11_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_11;
                }
                if((operand_a_11_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_12;
                }
                if((operand_a_11_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_13;
                }
                if((operand_a_11_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_14;
                }
                if((operand_a_11_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_15;
                }
                if((operand_a_11_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_16;
                }
                if((operand_a_11_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_17;
                }
                if((operand_a_11_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_18;
                }
                if((operand_a_11_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_19;
                }
                if((operand_a_11_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_20;
                }
                if((operand_a_11_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_21;
                }
                if((operand_a_11_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_22;
                }
                if((operand_a_11_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_23;
                }
                if((operand_a_11_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_24;
                }
                if((operand_a_11_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_25;
                }
                if((operand_a_11_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_26;
                }
                if((operand_a_11_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_27;
                }
                if((operand_a_11_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_28;
                }
                if((operand_a_11_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_29;
                }
                if((operand_a_11_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_30;
                }
                if((operand_a_11_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_31;
                }
                if((operand_a_11_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_11_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_11_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_11_1 = ((operand_a_11_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_11_2 = ((operand_a_11_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_11_3 = ((operand_a_11_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_11_4 = ((operand_a_11_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_11_5 = ((operand_a_11_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_11_6 = ((operand_a_11_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_11_7 = ((operand_a_11_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_11_8 = ((operand_a_11_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_11_9 = ((operand_a_11_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_11_10 = ((operand_a_11_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_11_11 = ((operand_a_11_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_11_12 = ((operand_a_11_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_11_13 = ((operand_a_11_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_11_14 = ((operand_a_11_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_11_15 = ((operand_a_11_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_11_16 = ((operand_a_11_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_11_17 = ((operand_a_11_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_11_18 = ((operand_a_11_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_11_19 = ((operand_a_11_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_11_20 = ((operand_a_11_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_11_21 = ((operand_a_11_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_11_22 = ((operand_a_11_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_11_23 = ((operand_a_11_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_11_24 = ((operand_a_11_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_11_25 = ((operand_a_11_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_11_26 = ((operand_a_11_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_11_27 = ((operand_a_11_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_11_28 = ((operand_a_11_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_11_29 = ((operand_a_11_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_11_30 = ((operand_a_11_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_11_31 = ((operand_a_11_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_11_32 = ((operand_a_11_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_11_data = meta.neuron_11_data + (bit<WORDSIZE>) res_11_1 + (bit<WORDSIZE>) res_11_2 + (bit<WORDSIZE>) res_11_3 + (bit<WORDSIZE>) res_11_4 + (bit<WORDSIZE>) res_11_5 + (bit<WORDSIZE>) res_11_6 + (bit<WORDSIZE>) res_11_7 + (bit<WORDSIZE>) res_11_8 + (bit<WORDSIZE>) res_11_9 + (bit<WORDSIZE>) res_11_10 + (bit<WORDSIZE>) res_11_11 + (bit<WORDSIZE>) res_11_12 + (bit<WORDSIZE>) res_11_13 + (bit<WORDSIZE>) res_11_14 + (bit<WORDSIZE>) res_11_15 + (bit<WORDSIZE>) res_11_16 + (bit<WORDSIZE>) res_11_17 + (bit<WORDSIZE>) res_11_18 + (bit<WORDSIZE>) res_11_19 + (bit<WORDSIZE>) res_11_20 + (bit<WORDSIZE>) res_11_21 + (bit<WORDSIZE>) res_11_22 + (bit<WORDSIZE>) res_11_23 + (bit<WORDSIZE>) res_11_24 + (bit<WORDSIZE>) res_11_25 + (bit<WORDSIZE>) res_11_26 + (bit<WORDSIZE>) res_11_27 + (bit<WORDSIZE>) res_11_28 + (bit<WORDSIZE>) res_11_29 + (bit<WORDSIZE>) res_11_30 + (bit<WORDSIZE>) res_11_31 + (bit<WORDSIZE>) res_11_32;
                // Store data to be fowarded
                reg_neuron_11_data.write(0, meta.neuron_11_data);

                // Neuron 12:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_12_1 = (bit<D_WORDSIZE>) meta.n2n_12_weight_1;
                bit<D_WORDSIZE> operand_a_12_2 = (bit<D_WORDSIZE>) meta.n2n_12_weight_2;
                bit<D_WORDSIZE> operand_a_12_3 = (bit<D_WORDSIZE>) meta.n2n_12_weight_3;
                bit<D_WORDSIZE> operand_a_12_4 = (bit<D_WORDSIZE>) meta.n2n_12_weight_4;
                bit<D_WORDSIZE> operand_a_12_5 = (bit<D_WORDSIZE>) meta.n2n_12_weight_5;
                bit<D_WORDSIZE> operand_a_12_6 = (bit<D_WORDSIZE>) meta.n2n_12_weight_6;
                bit<D_WORDSIZE> operand_a_12_7 = (bit<D_WORDSIZE>) meta.n2n_12_weight_7;
                bit<D_WORDSIZE> operand_a_12_8 = (bit<D_WORDSIZE>) meta.n2n_12_weight_8;
                bit<D_WORDSIZE> operand_a_12_9 = (bit<D_WORDSIZE>) meta.n2n_12_weight_9;
                bit<D_WORDSIZE> operand_a_12_10 = (bit<D_WORDSIZE>) meta.n2n_12_weight_10;
                bit<D_WORDSIZE> operand_a_12_11 = (bit<D_WORDSIZE>) meta.n2n_12_weight_11;
                bit<D_WORDSIZE> operand_a_12_12 = (bit<D_WORDSIZE>) meta.n2n_12_weight_12;
                bit<D_WORDSIZE> operand_a_12_13 = (bit<D_WORDSIZE>) meta.n2n_12_weight_13;
                bit<D_WORDSIZE> operand_a_12_14 = (bit<D_WORDSIZE>) meta.n2n_12_weight_14;
                bit<D_WORDSIZE> operand_a_12_15 = (bit<D_WORDSIZE>) meta.n2n_12_weight_15;
                bit<D_WORDSIZE> operand_a_12_16 = (bit<D_WORDSIZE>) meta.n2n_12_weight_16;
                bit<D_WORDSIZE> operand_a_12_17 = (bit<D_WORDSIZE>) meta.n2n_12_weight_17;
                bit<D_WORDSIZE> operand_a_12_18 = (bit<D_WORDSIZE>) meta.n2n_12_weight_18;
                bit<D_WORDSIZE> operand_a_12_19 = (bit<D_WORDSIZE>) meta.n2n_12_weight_19;
                bit<D_WORDSIZE> operand_a_12_20 = (bit<D_WORDSIZE>) meta.n2n_12_weight_20;
                bit<D_WORDSIZE> operand_a_12_21 = (bit<D_WORDSIZE>) meta.n2n_12_weight_21;
                bit<D_WORDSIZE> operand_a_12_22 = (bit<D_WORDSIZE>) meta.n2n_12_weight_22;
                bit<D_WORDSIZE> operand_a_12_23 = (bit<D_WORDSIZE>) meta.n2n_12_weight_23;
                bit<D_WORDSIZE> operand_a_12_24 = (bit<D_WORDSIZE>) meta.n2n_12_weight_24;
                bit<D_WORDSIZE> operand_a_12_25 = (bit<D_WORDSIZE>) meta.n2n_12_weight_25;
                bit<D_WORDSIZE> operand_a_12_26 = (bit<D_WORDSIZE>) meta.n2n_12_weight_26;
                bit<D_WORDSIZE> operand_a_12_27 = (bit<D_WORDSIZE>) meta.n2n_12_weight_27;
                bit<D_WORDSIZE> operand_a_12_28 = (bit<D_WORDSIZE>) meta.n2n_12_weight_28;
                bit<D_WORDSIZE> operand_a_12_29 = (bit<D_WORDSIZE>) meta.n2n_12_weight_29;
                bit<D_WORDSIZE> operand_a_12_30 = (bit<D_WORDSIZE>) meta.n2n_12_weight_30;
                bit<D_WORDSIZE> operand_a_12_31 = (bit<D_WORDSIZE>) meta.n2n_12_weight_31;
                bit<D_WORDSIZE> operand_a_12_32 = (bit<D_WORDSIZE>) meta.n2n_12_weight_32;
                // Sign extension
                if((operand_a_12_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_1;
                }
                if((operand_a_12_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_2;
                }
                if((operand_a_12_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_3;
                }
                if((operand_a_12_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_4;
                }
                if((operand_a_12_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_5;
                }
                if((operand_a_12_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_6;
                }
                if((operand_a_12_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_7;
                }
                if((operand_a_12_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_8;
                }
                if((operand_a_12_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_9;
                }
                if((operand_a_12_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_10;
                }
                if((operand_a_12_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_11;
                }
                if((operand_a_12_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_12;
                }
                if((operand_a_12_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_13;
                }
                if((operand_a_12_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_14;
                }
                if((operand_a_12_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_15;
                }
                if((operand_a_12_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_16;
                }
                if((operand_a_12_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_17;
                }
                if((operand_a_12_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_18;
                }
                if((operand_a_12_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_19;
                }
                if((operand_a_12_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_20;
                }
                if((operand_a_12_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_21;
                }
                if((operand_a_12_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_22;
                }
                if((operand_a_12_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_23;
                }
                if((operand_a_12_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_24;
                }
                if((operand_a_12_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_25;
                }
                if((operand_a_12_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_26;
                }
                if((operand_a_12_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_27;
                }
                if((operand_a_12_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_28;
                }
                if((operand_a_12_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_29;
                }
                if((operand_a_12_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_30;
                }
                if((operand_a_12_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_31;
                }
                if((operand_a_12_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_12_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_12_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_12_1 = ((operand_a_12_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_12_2 = ((operand_a_12_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_12_3 = ((operand_a_12_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_12_4 = ((operand_a_12_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_12_5 = ((operand_a_12_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_12_6 = ((operand_a_12_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_12_7 = ((operand_a_12_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_12_8 = ((operand_a_12_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_12_9 = ((operand_a_12_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_12_10 = ((operand_a_12_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_12_11 = ((operand_a_12_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_12_12 = ((operand_a_12_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_12_13 = ((operand_a_12_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_12_14 = ((operand_a_12_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_12_15 = ((operand_a_12_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_12_16 = ((operand_a_12_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_12_17 = ((operand_a_12_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_12_18 = ((operand_a_12_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_12_19 = ((operand_a_12_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_12_20 = ((operand_a_12_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_12_21 = ((operand_a_12_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_12_22 = ((operand_a_12_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_12_23 = ((operand_a_12_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_12_24 = ((operand_a_12_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_12_25 = ((operand_a_12_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_12_26 = ((operand_a_12_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_12_27 = ((operand_a_12_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_12_28 = ((operand_a_12_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_12_29 = ((operand_a_12_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_12_30 = ((operand_a_12_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_12_31 = ((operand_a_12_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_12_32 = ((operand_a_12_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_12_data = meta.neuron_12_data + (bit<WORDSIZE>) res_12_1 + (bit<WORDSIZE>) res_12_2 + (bit<WORDSIZE>) res_12_3 + (bit<WORDSIZE>) res_12_4 + (bit<WORDSIZE>) res_12_5 + (bit<WORDSIZE>) res_12_6 + (bit<WORDSIZE>) res_12_7 + (bit<WORDSIZE>) res_12_8 + (bit<WORDSIZE>) res_12_9 + (bit<WORDSIZE>) res_12_10 + (bit<WORDSIZE>) res_12_11 + (bit<WORDSIZE>) res_12_12 + (bit<WORDSIZE>) res_12_13 + (bit<WORDSIZE>) res_12_14 + (bit<WORDSIZE>) res_12_15 + (bit<WORDSIZE>) res_12_16 + (bit<WORDSIZE>) res_12_17 + (bit<WORDSIZE>) res_12_18 + (bit<WORDSIZE>) res_12_19 + (bit<WORDSIZE>) res_12_20 + (bit<WORDSIZE>) res_12_21 + (bit<WORDSIZE>) res_12_22 + (bit<WORDSIZE>) res_12_23 + (bit<WORDSIZE>) res_12_24 + (bit<WORDSIZE>) res_12_25 + (bit<WORDSIZE>) res_12_26 + (bit<WORDSIZE>) res_12_27 + (bit<WORDSIZE>) res_12_28 + (bit<WORDSIZE>) res_12_29 + (bit<WORDSIZE>) res_12_30 + (bit<WORDSIZE>) res_12_31 + (bit<WORDSIZE>) res_12_32;
                // Store data to be fowarded
                reg_neuron_12_data.write(0, meta.neuron_12_data);

                // Neuron 13:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_13_1 = (bit<D_WORDSIZE>) meta.n2n_13_weight_1;
                bit<D_WORDSIZE> operand_a_13_2 = (bit<D_WORDSIZE>) meta.n2n_13_weight_2;
                bit<D_WORDSIZE> operand_a_13_3 = (bit<D_WORDSIZE>) meta.n2n_13_weight_3;
                bit<D_WORDSIZE> operand_a_13_4 = (bit<D_WORDSIZE>) meta.n2n_13_weight_4;
                bit<D_WORDSIZE> operand_a_13_5 = (bit<D_WORDSIZE>) meta.n2n_13_weight_5;
                bit<D_WORDSIZE> operand_a_13_6 = (bit<D_WORDSIZE>) meta.n2n_13_weight_6;
                bit<D_WORDSIZE> operand_a_13_7 = (bit<D_WORDSIZE>) meta.n2n_13_weight_7;
                bit<D_WORDSIZE> operand_a_13_8 = (bit<D_WORDSIZE>) meta.n2n_13_weight_8;
                bit<D_WORDSIZE> operand_a_13_9 = (bit<D_WORDSIZE>) meta.n2n_13_weight_9;
                bit<D_WORDSIZE> operand_a_13_10 = (bit<D_WORDSIZE>) meta.n2n_13_weight_10;
                bit<D_WORDSIZE> operand_a_13_11 = (bit<D_WORDSIZE>) meta.n2n_13_weight_11;
                bit<D_WORDSIZE> operand_a_13_12 = (bit<D_WORDSIZE>) meta.n2n_13_weight_12;
                bit<D_WORDSIZE> operand_a_13_13 = (bit<D_WORDSIZE>) meta.n2n_13_weight_13;
                bit<D_WORDSIZE> operand_a_13_14 = (bit<D_WORDSIZE>) meta.n2n_13_weight_14;
                bit<D_WORDSIZE> operand_a_13_15 = (bit<D_WORDSIZE>) meta.n2n_13_weight_15;
                bit<D_WORDSIZE> operand_a_13_16 = (bit<D_WORDSIZE>) meta.n2n_13_weight_16;
                bit<D_WORDSIZE> operand_a_13_17 = (bit<D_WORDSIZE>) meta.n2n_13_weight_17;
                bit<D_WORDSIZE> operand_a_13_18 = (bit<D_WORDSIZE>) meta.n2n_13_weight_18;
                bit<D_WORDSIZE> operand_a_13_19 = (bit<D_WORDSIZE>) meta.n2n_13_weight_19;
                bit<D_WORDSIZE> operand_a_13_20 = (bit<D_WORDSIZE>) meta.n2n_13_weight_20;
                bit<D_WORDSIZE> operand_a_13_21 = (bit<D_WORDSIZE>) meta.n2n_13_weight_21;
                bit<D_WORDSIZE> operand_a_13_22 = (bit<D_WORDSIZE>) meta.n2n_13_weight_22;
                bit<D_WORDSIZE> operand_a_13_23 = (bit<D_WORDSIZE>) meta.n2n_13_weight_23;
                bit<D_WORDSIZE> operand_a_13_24 = (bit<D_WORDSIZE>) meta.n2n_13_weight_24;
                bit<D_WORDSIZE> operand_a_13_25 = (bit<D_WORDSIZE>) meta.n2n_13_weight_25;
                bit<D_WORDSIZE> operand_a_13_26 = (bit<D_WORDSIZE>) meta.n2n_13_weight_26;
                bit<D_WORDSIZE> operand_a_13_27 = (bit<D_WORDSIZE>) meta.n2n_13_weight_27;
                bit<D_WORDSIZE> operand_a_13_28 = (bit<D_WORDSIZE>) meta.n2n_13_weight_28;
                bit<D_WORDSIZE> operand_a_13_29 = (bit<D_WORDSIZE>) meta.n2n_13_weight_29;
                bit<D_WORDSIZE> operand_a_13_30 = (bit<D_WORDSIZE>) meta.n2n_13_weight_30;
                bit<D_WORDSIZE> operand_a_13_31 = (bit<D_WORDSIZE>) meta.n2n_13_weight_31;
                bit<D_WORDSIZE> operand_a_13_32 = (bit<D_WORDSIZE>) meta.n2n_13_weight_32;
                // Sign extension
                if((operand_a_13_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_1;
                }
                if((operand_a_13_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_2;
                }
                if((operand_a_13_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_3;
                }
                if((operand_a_13_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_4;
                }
                if((operand_a_13_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_5;
                }
                if((operand_a_13_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_6;
                }
                if((operand_a_13_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_7;
                }
                if((operand_a_13_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_8;
                }
                if((operand_a_13_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_9;
                }
                if((operand_a_13_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_10;
                }
                if((operand_a_13_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_11;
                }
                if((operand_a_13_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_12;
                }
                if((operand_a_13_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_13;
                }
                if((operand_a_13_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_14;
                }
                if((operand_a_13_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_15;
                }
                if((operand_a_13_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_16;
                }
                if((operand_a_13_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_17;
                }
                if((operand_a_13_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_18;
                }
                if((operand_a_13_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_19;
                }
                if((operand_a_13_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_20;
                }
                if((operand_a_13_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_21;
                }
                if((operand_a_13_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_22;
                }
                if((operand_a_13_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_23;
                }
                if((operand_a_13_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_24;
                }
                if((operand_a_13_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_25;
                }
                if((operand_a_13_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_26;
                }
                if((operand_a_13_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_27;
                }
                if((operand_a_13_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_28;
                }
                if((operand_a_13_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_29;
                }
                if((operand_a_13_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_30;
                }
                if((operand_a_13_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_31;
                }
                if((operand_a_13_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_13_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_13_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_13_1 = ((operand_a_13_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_13_2 = ((operand_a_13_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_13_3 = ((operand_a_13_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_13_4 = ((operand_a_13_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_13_5 = ((operand_a_13_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_13_6 = ((operand_a_13_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_13_7 = ((operand_a_13_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_13_8 = ((operand_a_13_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_13_9 = ((operand_a_13_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_13_10 = ((operand_a_13_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_13_11 = ((operand_a_13_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_13_12 = ((operand_a_13_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_13_13 = ((operand_a_13_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_13_14 = ((operand_a_13_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_13_15 = ((operand_a_13_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_13_16 = ((operand_a_13_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_13_17 = ((operand_a_13_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_13_18 = ((operand_a_13_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_13_19 = ((operand_a_13_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_13_20 = ((operand_a_13_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_13_21 = ((operand_a_13_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_13_22 = ((operand_a_13_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_13_23 = ((operand_a_13_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_13_24 = ((operand_a_13_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_13_25 = ((operand_a_13_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_13_26 = ((operand_a_13_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_13_27 = ((operand_a_13_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_13_28 = ((operand_a_13_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_13_29 = ((operand_a_13_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_13_30 = ((operand_a_13_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_13_31 = ((operand_a_13_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_13_32 = ((operand_a_13_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_13_data = meta.neuron_13_data + (bit<WORDSIZE>) res_13_1 + (bit<WORDSIZE>) res_13_2 + (bit<WORDSIZE>) res_13_3 + (bit<WORDSIZE>) res_13_4 + (bit<WORDSIZE>) res_13_5 + (bit<WORDSIZE>) res_13_6 + (bit<WORDSIZE>) res_13_7 + (bit<WORDSIZE>) res_13_8 + (bit<WORDSIZE>) res_13_9 + (bit<WORDSIZE>) res_13_10 + (bit<WORDSIZE>) res_13_11 + (bit<WORDSIZE>) res_13_12 + (bit<WORDSIZE>) res_13_13 + (bit<WORDSIZE>) res_13_14 + (bit<WORDSIZE>) res_13_15 + (bit<WORDSIZE>) res_13_16 + (bit<WORDSIZE>) res_13_17 + (bit<WORDSIZE>) res_13_18 + (bit<WORDSIZE>) res_13_19 + (bit<WORDSIZE>) res_13_20 + (bit<WORDSIZE>) res_13_21 + (bit<WORDSIZE>) res_13_22 + (bit<WORDSIZE>) res_13_23 + (bit<WORDSIZE>) res_13_24 + (bit<WORDSIZE>) res_13_25 + (bit<WORDSIZE>) res_13_26 + (bit<WORDSIZE>) res_13_27 + (bit<WORDSIZE>) res_13_28 + (bit<WORDSIZE>) res_13_29 + (bit<WORDSIZE>) res_13_30 + (bit<WORDSIZE>) res_13_31 + (bit<WORDSIZE>) res_13_32;
                // Store data to be fowarded
                reg_neuron_13_data.write(0, meta.neuron_13_data);

                // Neuron 14:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_14_1 = (bit<D_WORDSIZE>) meta.n2n_14_weight_1;
                bit<D_WORDSIZE> operand_a_14_2 = (bit<D_WORDSIZE>) meta.n2n_14_weight_2;
                bit<D_WORDSIZE> operand_a_14_3 = (bit<D_WORDSIZE>) meta.n2n_14_weight_3;
                bit<D_WORDSIZE> operand_a_14_4 = (bit<D_WORDSIZE>) meta.n2n_14_weight_4;
                bit<D_WORDSIZE> operand_a_14_5 = (bit<D_WORDSIZE>) meta.n2n_14_weight_5;
                bit<D_WORDSIZE> operand_a_14_6 = (bit<D_WORDSIZE>) meta.n2n_14_weight_6;
                bit<D_WORDSIZE> operand_a_14_7 = (bit<D_WORDSIZE>) meta.n2n_14_weight_7;
                bit<D_WORDSIZE> operand_a_14_8 = (bit<D_WORDSIZE>) meta.n2n_14_weight_8;
                bit<D_WORDSIZE> operand_a_14_9 = (bit<D_WORDSIZE>) meta.n2n_14_weight_9;
                bit<D_WORDSIZE> operand_a_14_10 = (bit<D_WORDSIZE>) meta.n2n_14_weight_10;
                bit<D_WORDSIZE> operand_a_14_11 = (bit<D_WORDSIZE>) meta.n2n_14_weight_11;
                bit<D_WORDSIZE> operand_a_14_12 = (bit<D_WORDSIZE>) meta.n2n_14_weight_12;
                bit<D_WORDSIZE> operand_a_14_13 = (bit<D_WORDSIZE>) meta.n2n_14_weight_13;
                bit<D_WORDSIZE> operand_a_14_14 = (bit<D_WORDSIZE>) meta.n2n_14_weight_14;
                bit<D_WORDSIZE> operand_a_14_15 = (bit<D_WORDSIZE>) meta.n2n_14_weight_15;
                bit<D_WORDSIZE> operand_a_14_16 = (bit<D_WORDSIZE>) meta.n2n_14_weight_16;
                bit<D_WORDSIZE> operand_a_14_17 = (bit<D_WORDSIZE>) meta.n2n_14_weight_17;
                bit<D_WORDSIZE> operand_a_14_18 = (bit<D_WORDSIZE>) meta.n2n_14_weight_18;
                bit<D_WORDSIZE> operand_a_14_19 = (bit<D_WORDSIZE>) meta.n2n_14_weight_19;
                bit<D_WORDSIZE> operand_a_14_20 = (bit<D_WORDSIZE>) meta.n2n_14_weight_20;
                bit<D_WORDSIZE> operand_a_14_21 = (bit<D_WORDSIZE>) meta.n2n_14_weight_21;
                bit<D_WORDSIZE> operand_a_14_22 = (bit<D_WORDSIZE>) meta.n2n_14_weight_22;
                bit<D_WORDSIZE> operand_a_14_23 = (bit<D_WORDSIZE>) meta.n2n_14_weight_23;
                bit<D_WORDSIZE> operand_a_14_24 = (bit<D_WORDSIZE>) meta.n2n_14_weight_24;
                bit<D_WORDSIZE> operand_a_14_25 = (bit<D_WORDSIZE>) meta.n2n_14_weight_25;
                bit<D_WORDSIZE> operand_a_14_26 = (bit<D_WORDSIZE>) meta.n2n_14_weight_26;
                bit<D_WORDSIZE> operand_a_14_27 = (bit<D_WORDSIZE>) meta.n2n_14_weight_27;
                bit<D_WORDSIZE> operand_a_14_28 = (bit<D_WORDSIZE>) meta.n2n_14_weight_28;
                bit<D_WORDSIZE> operand_a_14_29 = (bit<D_WORDSIZE>) meta.n2n_14_weight_29;
                bit<D_WORDSIZE> operand_a_14_30 = (bit<D_WORDSIZE>) meta.n2n_14_weight_30;
                bit<D_WORDSIZE> operand_a_14_31 = (bit<D_WORDSIZE>) meta.n2n_14_weight_31;
                bit<D_WORDSIZE> operand_a_14_32 = (bit<D_WORDSIZE>) meta.n2n_14_weight_32;
                // Sign extension
                if((operand_a_14_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_1;
                }
                if((operand_a_14_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_2;
                }
                if((operand_a_14_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_3;
                }
                if((operand_a_14_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_4;
                }
                if((operand_a_14_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_5;
                }
                if((operand_a_14_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_6;
                }
                if((operand_a_14_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_7;
                }
                if((operand_a_14_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_8;
                }
                if((operand_a_14_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_9;
                }
                if((operand_a_14_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_10;
                }
                if((operand_a_14_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_11;
                }
                if((operand_a_14_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_12;
                }
                if((operand_a_14_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_13;
                }
                if((operand_a_14_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_14;
                }
                if((operand_a_14_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_15;
                }
                if((operand_a_14_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_16;
                }
                if((operand_a_14_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_17;
                }
                if((operand_a_14_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_18;
                }
                if((operand_a_14_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_19;
                }
                if((operand_a_14_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_20;
                }
                if((operand_a_14_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_21;
                }
                if((operand_a_14_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_22;
                }
                if((operand_a_14_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_23;
                }
                if((operand_a_14_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_24;
                }
                if((operand_a_14_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_25;
                }
                if((operand_a_14_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_26;
                }
                if((operand_a_14_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_27;
                }
                if((operand_a_14_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_28;
                }
                if((operand_a_14_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_29;
                }
                if((operand_a_14_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_30;
                }
                if((operand_a_14_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_31;
                }
                if((operand_a_14_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_14_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_14_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_14_1 = ((operand_a_14_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_14_2 = ((operand_a_14_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_14_3 = ((operand_a_14_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_14_4 = ((operand_a_14_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_14_5 = ((operand_a_14_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_14_6 = ((operand_a_14_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_14_7 = ((operand_a_14_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_14_8 = ((operand_a_14_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_14_9 = ((operand_a_14_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_14_10 = ((operand_a_14_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_14_11 = ((operand_a_14_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_14_12 = ((operand_a_14_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_14_13 = ((operand_a_14_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_14_14 = ((operand_a_14_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_14_15 = ((operand_a_14_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_14_16 = ((operand_a_14_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_14_17 = ((operand_a_14_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_14_18 = ((operand_a_14_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_14_19 = ((operand_a_14_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_14_20 = ((operand_a_14_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_14_21 = ((operand_a_14_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_14_22 = ((operand_a_14_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_14_23 = ((operand_a_14_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_14_24 = ((operand_a_14_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_14_25 = ((operand_a_14_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_14_26 = ((operand_a_14_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_14_27 = ((operand_a_14_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_14_28 = ((operand_a_14_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_14_29 = ((operand_a_14_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_14_30 = ((operand_a_14_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_14_31 = ((operand_a_14_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_14_32 = ((operand_a_14_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_14_data = meta.neuron_14_data + (bit<WORDSIZE>) res_14_1 + (bit<WORDSIZE>) res_14_2 + (bit<WORDSIZE>) res_14_3 + (bit<WORDSIZE>) res_14_4 + (bit<WORDSIZE>) res_14_5 + (bit<WORDSIZE>) res_14_6 + (bit<WORDSIZE>) res_14_7 + (bit<WORDSIZE>) res_14_8 + (bit<WORDSIZE>) res_14_9 + (bit<WORDSIZE>) res_14_10 + (bit<WORDSIZE>) res_14_11 + (bit<WORDSIZE>) res_14_12 + (bit<WORDSIZE>) res_14_13 + (bit<WORDSIZE>) res_14_14 + (bit<WORDSIZE>) res_14_15 + (bit<WORDSIZE>) res_14_16 + (bit<WORDSIZE>) res_14_17 + (bit<WORDSIZE>) res_14_18 + (bit<WORDSIZE>) res_14_19 + (bit<WORDSIZE>) res_14_20 + (bit<WORDSIZE>) res_14_21 + (bit<WORDSIZE>) res_14_22 + (bit<WORDSIZE>) res_14_23 + (bit<WORDSIZE>) res_14_24 + (bit<WORDSIZE>) res_14_25 + (bit<WORDSIZE>) res_14_26 + (bit<WORDSIZE>) res_14_27 + (bit<WORDSIZE>) res_14_28 + (bit<WORDSIZE>) res_14_29 + (bit<WORDSIZE>) res_14_30 + (bit<WORDSIZE>) res_14_31 + (bit<WORDSIZE>) res_14_32;
                // Store data to be fowarded
                reg_neuron_14_data.write(0, meta.neuron_14_data);

                // Neuron 15:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_15_1 = (bit<D_WORDSIZE>) meta.n2n_15_weight_1;
                bit<D_WORDSIZE> operand_a_15_2 = (bit<D_WORDSIZE>) meta.n2n_15_weight_2;
                bit<D_WORDSIZE> operand_a_15_3 = (bit<D_WORDSIZE>) meta.n2n_15_weight_3;
                bit<D_WORDSIZE> operand_a_15_4 = (bit<D_WORDSIZE>) meta.n2n_15_weight_4;
                bit<D_WORDSIZE> operand_a_15_5 = (bit<D_WORDSIZE>) meta.n2n_15_weight_5;
                bit<D_WORDSIZE> operand_a_15_6 = (bit<D_WORDSIZE>) meta.n2n_15_weight_6;
                bit<D_WORDSIZE> operand_a_15_7 = (bit<D_WORDSIZE>) meta.n2n_15_weight_7;
                bit<D_WORDSIZE> operand_a_15_8 = (bit<D_WORDSIZE>) meta.n2n_15_weight_8;
                bit<D_WORDSIZE> operand_a_15_9 = (bit<D_WORDSIZE>) meta.n2n_15_weight_9;
                bit<D_WORDSIZE> operand_a_15_10 = (bit<D_WORDSIZE>) meta.n2n_15_weight_10;
                bit<D_WORDSIZE> operand_a_15_11 = (bit<D_WORDSIZE>) meta.n2n_15_weight_11;
                bit<D_WORDSIZE> operand_a_15_12 = (bit<D_WORDSIZE>) meta.n2n_15_weight_12;
                bit<D_WORDSIZE> operand_a_15_13 = (bit<D_WORDSIZE>) meta.n2n_15_weight_13;
                bit<D_WORDSIZE> operand_a_15_14 = (bit<D_WORDSIZE>) meta.n2n_15_weight_14;
                bit<D_WORDSIZE> operand_a_15_15 = (bit<D_WORDSIZE>) meta.n2n_15_weight_15;
                bit<D_WORDSIZE> operand_a_15_16 = (bit<D_WORDSIZE>) meta.n2n_15_weight_16;
                bit<D_WORDSIZE> operand_a_15_17 = (bit<D_WORDSIZE>) meta.n2n_15_weight_17;
                bit<D_WORDSIZE> operand_a_15_18 = (bit<D_WORDSIZE>) meta.n2n_15_weight_18;
                bit<D_WORDSIZE> operand_a_15_19 = (bit<D_WORDSIZE>) meta.n2n_15_weight_19;
                bit<D_WORDSIZE> operand_a_15_20 = (bit<D_WORDSIZE>) meta.n2n_15_weight_20;
                bit<D_WORDSIZE> operand_a_15_21 = (bit<D_WORDSIZE>) meta.n2n_15_weight_21;
                bit<D_WORDSIZE> operand_a_15_22 = (bit<D_WORDSIZE>) meta.n2n_15_weight_22;
                bit<D_WORDSIZE> operand_a_15_23 = (bit<D_WORDSIZE>) meta.n2n_15_weight_23;
                bit<D_WORDSIZE> operand_a_15_24 = (bit<D_WORDSIZE>) meta.n2n_15_weight_24;
                bit<D_WORDSIZE> operand_a_15_25 = (bit<D_WORDSIZE>) meta.n2n_15_weight_25;
                bit<D_WORDSIZE> operand_a_15_26 = (bit<D_WORDSIZE>) meta.n2n_15_weight_26;
                bit<D_WORDSIZE> operand_a_15_27 = (bit<D_WORDSIZE>) meta.n2n_15_weight_27;
                bit<D_WORDSIZE> operand_a_15_28 = (bit<D_WORDSIZE>) meta.n2n_15_weight_28;
                bit<D_WORDSIZE> operand_a_15_29 = (bit<D_WORDSIZE>) meta.n2n_15_weight_29;
                bit<D_WORDSIZE> operand_a_15_30 = (bit<D_WORDSIZE>) meta.n2n_15_weight_30;
                bit<D_WORDSIZE> operand_a_15_31 = (bit<D_WORDSIZE>) meta.n2n_15_weight_31;
                bit<D_WORDSIZE> operand_a_15_32 = (bit<D_WORDSIZE>) meta.n2n_15_weight_32;
                // Sign extension
                if((operand_a_15_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_1;
                }
                if((operand_a_15_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_2;
                }
                if((operand_a_15_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_3;
                }
                if((operand_a_15_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_4;
                }
                if((operand_a_15_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_5;
                }
                if((operand_a_15_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_6;
                }
                if((operand_a_15_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_7;
                }
                if((operand_a_15_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_8;
                }
                if((operand_a_15_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_9;
                }
                if((operand_a_15_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_10;
                }
                if((operand_a_15_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_11;
                }
                if((operand_a_15_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_12;
                }
                if((operand_a_15_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_13;
                }
                if((operand_a_15_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_14;
                }
                if((operand_a_15_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_15;
                }
                if((operand_a_15_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_16;
                }
                if((operand_a_15_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_17;
                }
                if((operand_a_15_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_18;
                }
                if((operand_a_15_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_19;
                }
                if((operand_a_15_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_20;
                }
                if((operand_a_15_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_21;
                }
                if((operand_a_15_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_22;
                }
                if((operand_a_15_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_23;
                }
                if((operand_a_15_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_24;
                }
                if((operand_a_15_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_25;
                }
                if((operand_a_15_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_26;
                }
                if((operand_a_15_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_27;
                }
                if((operand_a_15_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_28;
                }
                if((operand_a_15_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_29;
                }
                if((operand_a_15_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_30;
                }
                if((operand_a_15_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_31;
                }
                if((operand_a_15_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_15_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_15_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_15_1 = ((operand_a_15_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_15_2 = ((operand_a_15_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_15_3 = ((operand_a_15_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_15_4 = ((operand_a_15_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_15_5 = ((operand_a_15_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_15_6 = ((operand_a_15_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_15_7 = ((operand_a_15_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_15_8 = ((operand_a_15_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_15_9 = ((operand_a_15_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_15_10 = ((operand_a_15_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_15_11 = ((operand_a_15_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_15_12 = ((operand_a_15_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_15_13 = ((operand_a_15_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_15_14 = ((operand_a_15_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_15_15 = ((operand_a_15_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_15_16 = ((operand_a_15_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_15_17 = ((operand_a_15_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_15_18 = ((operand_a_15_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_15_19 = ((operand_a_15_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_15_20 = ((operand_a_15_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_15_21 = ((operand_a_15_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_15_22 = ((operand_a_15_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_15_23 = ((operand_a_15_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_15_24 = ((operand_a_15_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_15_25 = ((operand_a_15_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_15_26 = ((operand_a_15_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_15_27 = ((operand_a_15_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_15_28 = ((operand_a_15_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_15_29 = ((operand_a_15_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_15_30 = ((operand_a_15_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_15_31 = ((operand_a_15_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_15_32 = ((operand_a_15_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_15_data = meta.neuron_15_data + (bit<WORDSIZE>) res_15_1 + (bit<WORDSIZE>) res_15_2 + (bit<WORDSIZE>) res_15_3 + (bit<WORDSIZE>) res_15_4 + (bit<WORDSIZE>) res_15_5 + (bit<WORDSIZE>) res_15_6 + (bit<WORDSIZE>) res_15_7 + (bit<WORDSIZE>) res_15_8 + (bit<WORDSIZE>) res_15_9 + (bit<WORDSIZE>) res_15_10 + (bit<WORDSIZE>) res_15_11 + (bit<WORDSIZE>) res_15_12 + (bit<WORDSIZE>) res_15_13 + (bit<WORDSIZE>) res_15_14 + (bit<WORDSIZE>) res_15_15 + (bit<WORDSIZE>) res_15_16 + (bit<WORDSIZE>) res_15_17 + (bit<WORDSIZE>) res_15_18 + (bit<WORDSIZE>) res_15_19 + (bit<WORDSIZE>) res_15_20 + (bit<WORDSIZE>) res_15_21 + (bit<WORDSIZE>) res_15_22 + (bit<WORDSIZE>) res_15_23 + (bit<WORDSIZE>) res_15_24 + (bit<WORDSIZE>) res_15_25 + (bit<WORDSIZE>) res_15_26 + (bit<WORDSIZE>) res_15_27 + (bit<WORDSIZE>) res_15_28 + (bit<WORDSIZE>) res_15_29 + (bit<WORDSIZE>) res_15_30 + (bit<WORDSIZE>) res_15_31 + (bit<WORDSIZE>) res_15_32;
                // Store data to be fowarded
                reg_neuron_15_data.write(0, meta.neuron_15_data);

                // Neuron 16:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_16_1 = (bit<D_WORDSIZE>) meta.n2n_16_weight_1;
                bit<D_WORDSIZE> operand_a_16_2 = (bit<D_WORDSIZE>) meta.n2n_16_weight_2;
                bit<D_WORDSIZE> operand_a_16_3 = (bit<D_WORDSIZE>) meta.n2n_16_weight_3;
                bit<D_WORDSIZE> operand_a_16_4 = (bit<D_WORDSIZE>) meta.n2n_16_weight_4;
                bit<D_WORDSIZE> operand_a_16_5 = (bit<D_WORDSIZE>) meta.n2n_16_weight_5;
                bit<D_WORDSIZE> operand_a_16_6 = (bit<D_WORDSIZE>) meta.n2n_16_weight_6;
                bit<D_WORDSIZE> operand_a_16_7 = (bit<D_WORDSIZE>) meta.n2n_16_weight_7;
                bit<D_WORDSIZE> operand_a_16_8 = (bit<D_WORDSIZE>) meta.n2n_16_weight_8;
                bit<D_WORDSIZE> operand_a_16_9 = (bit<D_WORDSIZE>) meta.n2n_16_weight_9;
                bit<D_WORDSIZE> operand_a_16_10 = (bit<D_WORDSIZE>) meta.n2n_16_weight_10;
                bit<D_WORDSIZE> operand_a_16_11 = (bit<D_WORDSIZE>) meta.n2n_16_weight_11;
                bit<D_WORDSIZE> operand_a_16_12 = (bit<D_WORDSIZE>) meta.n2n_16_weight_12;
                bit<D_WORDSIZE> operand_a_16_13 = (bit<D_WORDSIZE>) meta.n2n_16_weight_13;
                bit<D_WORDSIZE> operand_a_16_14 = (bit<D_WORDSIZE>) meta.n2n_16_weight_14;
                bit<D_WORDSIZE> operand_a_16_15 = (bit<D_WORDSIZE>) meta.n2n_16_weight_15;
                bit<D_WORDSIZE> operand_a_16_16 = (bit<D_WORDSIZE>) meta.n2n_16_weight_16;
                bit<D_WORDSIZE> operand_a_16_17 = (bit<D_WORDSIZE>) meta.n2n_16_weight_17;
                bit<D_WORDSIZE> operand_a_16_18 = (bit<D_WORDSIZE>) meta.n2n_16_weight_18;
                bit<D_WORDSIZE> operand_a_16_19 = (bit<D_WORDSIZE>) meta.n2n_16_weight_19;
                bit<D_WORDSIZE> operand_a_16_20 = (bit<D_WORDSIZE>) meta.n2n_16_weight_20;
                bit<D_WORDSIZE> operand_a_16_21 = (bit<D_WORDSIZE>) meta.n2n_16_weight_21;
                bit<D_WORDSIZE> operand_a_16_22 = (bit<D_WORDSIZE>) meta.n2n_16_weight_22;
                bit<D_WORDSIZE> operand_a_16_23 = (bit<D_WORDSIZE>) meta.n2n_16_weight_23;
                bit<D_WORDSIZE> operand_a_16_24 = (bit<D_WORDSIZE>) meta.n2n_16_weight_24;
                bit<D_WORDSIZE> operand_a_16_25 = (bit<D_WORDSIZE>) meta.n2n_16_weight_25;
                bit<D_WORDSIZE> operand_a_16_26 = (bit<D_WORDSIZE>) meta.n2n_16_weight_26;
                bit<D_WORDSIZE> operand_a_16_27 = (bit<D_WORDSIZE>) meta.n2n_16_weight_27;
                bit<D_WORDSIZE> operand_a_16_28 = (bit<D_WORDSIZE>) meta.n2n_16_weight_28;
                bit<D_WORDSIZE> operand_a_16_29 = (bit<D_WORDSIZE>) meta.n2n_16_weight_29;
                bit<D_WORDSIZE> operand_a_16_30 = (bit<D_WORDSIZE>) meta.n2n_16_weight_30;
                bit<D_WORDSIZE> operand_a_16_31 = (bit<D_WORDSIZE>) meta.n2n_16_weight_31;
                bit<D_WORDSIZE> operand_a_16_32 = (bit<D_WORDSIZE>) meta.n2n_16_weight_32;
                // Sign extension
                if((operand_a_16_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_1;
                }
                if((operand_a_16_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_2;
                }
                if((operand_a_16_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_3;
                }
                if((operand_a_16_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_4;
                }
                if((operand_a_16_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_5;
                }
                if((operand_a_16_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_6;
                }
                if((operand_a_16_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_7;
                }
                if((operand_a_16_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_8;
                }
                if((operand_a_16_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_9;
                }
                if((operand_a_16_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_10;
                }
                if((operand_a_16_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_11;
                }
                if((operand_a_16_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_12;
                }
                if((operand_a_16_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_13;
                }
                if((operand_a_16_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_14;
                }
                if((operand_a_16_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_15;
                }
                if((operand_a_16_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_16;
                }
                if((operand_a_16_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_17;
                }
                if((operand_a_16_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_18;
                }
                if((operand_a_16_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_19;
                }
                if((operand_a_16_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_20;
                }
                if((operand_a_16_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_21;
                }
                if((operand_a_16_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_22;
                }
                if((operand_a_16_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_23;
                }
                if((operand_a_16_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_24;
                }
                if((operand_a_16_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_25;
                }
                if((operand_a_16_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_26;
                }
                if((operand_a_16_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_27;
                }
                if((operand_a_16_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_28;
                }
                if((operand_a_16_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_29;
                }
                if((operand_a_16_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_30;
                }
                if((operand_a_16_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_31;
                }
                if((operand_a_16_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_16_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_16_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_16_1 = ((operand_a_16_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_16_2 = ((operand_a_16_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_16_3 = ((operand_a_16_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_16_4 = ((operand_a_16_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_16_5 = ((operand_a_16_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_16_6 = ((operand_a_16_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_16_7 = ((operand_a_16_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_16_8 = ((operand_a_16_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_16_9 = ((operand_a_16_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_16_10 = ((operand_a_16_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_16_11 = ((operand_a_16_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_16_12 = ((operand_a_16_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_16_13 = ((operand_a_16_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_16_14 = ((operand_a_16_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_16_15 = ((operand_a_16_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_16_16 = ((operand_a_16_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_16_17 = ((operand_a_16_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_16_18 = ((operand_a_16_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_16_19 = ((operand_a_16_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_16_20 = ((operand_a_16_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_16_21 = ((operand_a_16_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_16_22 = ((operand_a_16_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_16_23 = ((operand_a_16_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_16_24 = ((operand_a_16_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_16_25 = ((operand_a_16_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_16_26 = ((operand_a_16_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_16_27 = ((operand_a_16_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_16_28 = ((operand_a_16_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_16_29 = ((operand_a_16_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_16_30 = ((operand_a_16_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_16_31 = ((operand_a_16_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_16_32 = ((operand_a_16_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_16_data = meta.neuron_16_data + (bit<WORDSIZE>) res_16_1 + (bit<WORDSIZE>) res_16_2 + (bit<WORDSIZE>) res_16_3 + (bit<WORDSIZE>) res_16_4 + (bit<WORDSIZE>) res_16_5 + (bit<WORDSIZE>) res_16_6 + (bit<WORDSIZE>) res_16_7 + (bit<WORDSIZE>) res_16_8 + (bit<WORDSIZE>) res_16_9 + (bit<WORDSIZE>) res_16_10 + (bit<WORDSIZE>) res_16_11 + (bit<WORDSIZE>) res_16_12 + (bit<WORDSIZE>) res_16_13 + (bit<WORDSIZE>) res_16_14 + (bit<WORDSIZE>) res_16_15 + (bit<WORDSIZE>) res_16_16 + (bit<WORDSIZE>) res_16_17 + (bit<WORDSIZE>) res_16_18 + (bit<WORDSIZE>) res_16_19 + (bit<WORDSIZE>) res_16_20 + (bit<WORDSIZE>) res_16_21 + (bit<WORDSIZE>) res_16_22 + (bit<WORDSIZE>) res_16_23 + (bit<WORDSIZE>) res_16_24 + (bit<WORDSIZE>) res_16_25 + (bit<WORDSIZE>) res_16_26 + (bit<WORDSIZE>) res_16_27 + (bit<WORDSIZE>) res_16_28 + (bit<WORDSIZE>) res_16_29 + (bit<WORDSIZE>) res_16_30 + (bit<WORDSIZE>) res_16_31 + (bit<WORDSIZE>) res_16_32;
                // Store data to be fowarded
                reg_neuron_16_data.write(0, meta.neuron_16_data);

                // Neuron 17:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_17_1 = (bit<D_WORDSIZE>) meta.n2n_17_weight_1;
                bit<D_WORDSIZE> operand_a_17_2 = (bit<D_WORDSIZE>) meta.n2n_17_weight_2;
                bit<D_WORDSIZE> operand_a_17_3 = (bit<D_WORDSIZE>) meta.n2n_17_weight_3;
                bit<D_WORDSIZE> operand_a_17_4 = (bit<D_WORDSIZE>) meta.n2n_17_weight_4;
                bit<D_WORDSIZE> operand_a_17_5 = (bit<D_WORDSIZE>) meta.n2n_17_weight_5;
                bit<D_WORDSIZE> operand_a_17_6 = (bit<D_WORDSIZE>) meta.n2n_17_weight_6;
                bit<D_WORDSIZE> operand_a_17_7 = (bit<D_WORDSIZE>) meta.n2n_17_weight_7;
                bit<D_WORDSIZE> operand_a_17_8 = (bit<D_WORDSIZE>) meta.n2n_17_weight_8;
                bit<D_WORDSIZE> operand_a_17_9 = (bit<D_WORDSIZE>) meta.n2n_17_weight_9;
                bit<D_WORDSIZE> operand_a_17_10 = (bit<D_WORDSIZE>) meta.n2n_17_weight_10;
                bit<D_WORDSIZE> operand_a_17_11 = (bit<D_WORDSIZE>) meta.n2n_17_weight_11;
                bit<D_WORDSIZE> operand_a_17_12 = (bit<D_WORDSIZE>) meta.n2n_17_weight_12;
                bit<D_WORDSIZE> operand_a_17_13 = (bit<D_WORDSIZE>) meta.n2n_17_weight_13;
                bit<D_WORDSIZE> operand_a_17_14 = (bit<D_WORDSIZE>) meta.n2n_17_weight_14;
                bit<D_WORDSIZE> operand_a_17_15 = (bit<D_WORDSIZE>) meta.n2n_17_weight_15;
                bit<D_WORDSIZE> operand_a_17_16 = (bit<D_WORDSIZE>) meta.n2n_17_weight_16;
                bit<D_WORDSIZE> operand_a_17_17 = (bit<D_WORDSIZE>) meta.n2n_17_weight_17;
                bit<D_WORDSIZE> operand_a_17_18 = (bit<D_WORDSIZE>) meta.n2n_17_weight_18;
                bit<D_WORDSIZE> operand_a_17_19 = (bit<D_WORDSIZE>) meta.n2n_17_weight_19;
                bit<D_WORDSIZE> operand_a_17_20 = (bit<D_WORDSIZE>) meta.n2n_17_weight_20;
                bit<D_WORDSIZE> operand_a_17_21 = (bit<D_WORDSIZE>) meta.n2n_17_weight_21;
                bit<D_WORDSIZE> operand_a_17_22 = (bit<D_WORDSIZE>) meta.n2n_17_weight_22;
                bit<D_WORDSIZE> operand_a_17_23 = (bit<D_WORDSIZE>) meta.n2n_17_weight_23;
                bit<D_WORDSIZE> operand_a_17_24 = (bit<D_WORDSIZE>) meta.n2n_17_weight_24;
                bit<D_WORDSIZE> operand_a_17_25 = (bit<D_WORDSIZE>) meta.n2n_17_weight_25;
                bit<D_WORDSIZE> operand_a_17_26 = (bit<D_WORDSIZE>) meta.n2n_17_weight_26;
                bit<D_WORDSIZE> operand_a_17_27 = (bit<D_WORDSIZE>) meta.n2n_17_weight_27;
                bit<D_WORDSIZE> operand_a_17_28 = (bit<D_WORDSIZE>) meta.n2n_17_weight_28;
                bit<D_WORDSIZE> operand_a_17_29 = (bit<D_WORDSIZE>) meta.n2n_17_weight_29;
                bit<D_WORDSIZE> operand_a_17_30 = (bit<D_WORDSIZE>) meta.n2n_17_weight_30;
                bit<D_WORDSIZE> operand_a_17_31 = (bit<D_WORDSIZE>) meta.n2n_17_weight_31;
                bit<D_WORDSIZE> operand_a_17_32 = (bit<D_WORDSIZE>) meta.n2n_17_weight_32;
                // Sign extension
                if((operand_a_17_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_1;
                }
                if((operand_a_17_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_2;
                }
                if((operand_a_17_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_3;
                }
                if((operand_a_17_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_4;
                }
                if((operand_a_17_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_5;
                }
                if((operand_a_17_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_6;
                }
                if((operand_a_17_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_7;
                }
                if((operand_a_17_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_8;
                }
                if((operand_a_17_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_9;
                }
                if((operand_a_17_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_10;
                }
                if((operand_a_17_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_11;
                }
                if((operand_a_17_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_12;
                }
                if((operand_a_17_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_13;
                }
                if((operand_a_17_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_14;
                }
                if((operand_a_17_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_15;
                }
                if((operand_a_17_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_16;
                }
                if((operand_a_17_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_17;
                }
                if((operand_a_17_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_18;
                }
                if((operand_a_17_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_19;
                }
                if((operand_a_17_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_20;
                }
                if((operand_a_17_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_21;
                }
                if((operand_a_17_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_22;
                }
                if((operand_a_17_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_23;
                }
                if((operand_a_17_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_24;
                }
                if((operand_a_17_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_25;
                }
                if((operand_a_17_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_26;
                }
                if((operand_a_17_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_27;
                }
                if((operand_a_17_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_28;
                }
                if((operand_a_17_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_29;
                }
                if((operand_a_17_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_30;
                }
                if((operand_a_17_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_31;
                }
                if((operand_a_17_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_17_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_17_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_17_1 = ((operand_a_17_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_17_2 = ((operand_a_17_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_17_3 = ((operand_a_17_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_17_4 = ((operand_a_17_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_17_5 = ((operand_a_17_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_17_6 = ((operand_a_17_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_17_7 = ((operand_a_17_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_17_8 = ((operand_a_17_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_17_9 = ((operand_a_17_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_17_10 = ((operand_a_17_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_17_11 = ((operand_a_17_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_17_12 = ((operand_a_17_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_17_13 = ((operand_a_17_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_17_14 = ((operand_a_17_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_17_15 = ((operand_a_17_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_17_16 = ((operand_a_17_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_17_17 = ((operand_a_17_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_17_18 = ((operand_a_17_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_17_19 = ((operand_a_17_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_17_20 = ((operand_a_17_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_17_21 = ((operand_a_17_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_17_22 = ((operand_a_17_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_17_23 = ((operand_a_17_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_17_24 = ((operand_a_17_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_17_25 = ((operand_a_17_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_17_26 = ((operand_a_17_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_17_27 = ((operand_a_17_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_17_28 = ((operand_a_17_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_17_29 = ((operand_a_17_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_17_30 = ((operand_a_17_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_17_31 = ((operand_a_17_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_17_32 = ((operand_a_17_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_17_data = meta.neuron_17_data + (bit<WORDSIZE>) res_17_1 + (bit<WORDSIZE>) res_17_2 + (bit<WORDSIZE>) res_17_3 + (bit<WORDSIZE>) res_17_4 + (bit<WORDSIZE>) res_17_5 + (bit<WORDSIZE>) res_17_6 + (bit<WORDSIZE>) res_17_7 + (bit<WORDSIZE>) res_17_8 + (bit<WORDSIZE>) res_17_9 + (bit<WORDSIZE>) res_17_10 + (bit<WORDSIZE>) res_17_11 + (bit<WORDSIZE>) res_17_12 + (bit<WORDSIZE>) res_17_13 + (bit<WORDSIZE>) res_17_14 + (bit<WORDSIZE>) res_17_15 + (bit<WORDSIZE>) res_17_16 + (bit<WORDSIZE>) res_17_17 + (bit<WORDSIZE>) res_17_18 + (bit<WORDSIZE>) res_17_19 + (bit<WORDSIZE>) res_17_20 + (bit<WORDSIZE>) res_17_21 + (bit<WORDSIZE>) res_17_22 + (bit<WORDSIZE>) res_17_23 + (bit<WORDSIZE>) res_17_24 + (bit<WORDSIZE>) res_17_25 + (bit<WORDSIZE>) res_17_26 + (bit<WORDSIZE>) res_17_27 + (bit<WORDSIZE>) res_17_28 + (bit<WORDSIZE>) res_17_29 + (bit<WORDSIZE>) res_17_30 + (bit<WORDSIZE>) res_17_31 + (bit<WORDSIZE>) res_17_32;
                // Store data to be fowarded
                reg_neuron_17_data.write(0, meta.neuron_17_data);

                // Neuron 18:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_18_1 = (bit<D_WORDSIZE>) meta.n2n_18_weight_1;
                bit<D_WORDSIZE> operand_a_18_2 = (bit<D_WORDSIZE>) meta.n2n_18_weight_2;
                bit<D_WORDSIZE> operand_a_18_3 = (bit<D_WORDSIZE>) meta.n2n_18_weight_3;
                bit<D_WORDSIZE> operand_a_18_4 = (bit<D_WORDSIZE>) meta.n2n_18_weight_4;
                bit<D_WORDSIZE> operand_a_18_5 = (bit<D_WORDSIZE>) meta.n2n_18_weight_5;
                bit<D_WORDSIZE> operand_a_18_6 = (bit<D_WORDSIZE>) meta.n2n_18_weight_6;
                bit<D_WORDSIZE> operand_a_18_7 = (bit<D_WORDSIZE>) meta.n2n_18_weight_7;
                bit<D_WORDSIZE> operand_a_18_8 = (bit<D_WORDSIZE>) meta.n2n_18_weight_8;
                bit<D_WORDSIZE> operand_a_18_9 = (bit<D_WORDSIZE>) meta.n2n_18_weight_9;
                bit<D_WORDSIZE> operand_a_18_10 = (bit<D_WORDSIZE>) meta.n2n_18_weight_10;
                bit<D_WORDSIZE> operand_a_18_11 = (bit<D_WORDSIZE>) meta.n2n_18_weight_11;
                bit<D_WORDSIZE> operand_a_18_12 = (bit<D_WORDSIZE>) meta.n2n_18_weight_12;
                bit<D_WORDSIZE> operand_a_18_13 = (bit<D_WORDSIZE>) meta.n2n_18_weight_13;
                bit<D_WORDSIZE> operand_a_18_14 = (bit<D_WORDSIZE>) meta.n2n_18_weight_14;
                bit<D_WORDSIZE> operand_a_18_15 = (bit<D_WORDSIZE>) meta.n2n_18_weight_15;
                bit<D_WORDSIZE> operand_a_18_16 = (bit<D_WORDSIZE>) meta.n2n_18_weight_16;
                bit<D_WORDSIZE> operand_a_18_17 = (bit<D_WORDSIZE>) meta.n2n_18_weight_17;
                bit<D_WORDSIZE> operand_a_18_18 = (bit<D_WORDSIZE>) meta.n2n_18_weight_18;
                bit<D_WORDSIZE> operand_a_18_19 = (bit<D_WORDSIZE>) meta.n2n_18_weight_19;
                bit<D_WORDSIZE> operand_a_18_20 = (bit<D_WORDSIZE>) meta.n2n_18_weight_20;
                bit<D_WORDSIZE> operand_a_18_21 = (bit<D_WORDSIZE>) meta.n2n_18_weight_21;
                bit<D_WORDSIZE> operand_a_18_22 = (bit<D_WORDSIZE>) meta.n2n_18_weight_22;
                bit<D_WORDSIZE> operand_a_18_23 = (bit<D_WORDSIZE>) meta.n2n_18_weight_23;
                bit<D_WORDSIZE> operand_a_18_24 = (bit<D_WORDSIZE>) meta.n2n_18_weight_24;
                bit<D_WORDSIZE> operand_a_18_25 = (bit<D_WORDSIZE>) meta.n2n_18_weight_25;
                bit<D_WORDSIZE> operand_a_18_26 = (bit<D_WORDSIZE>) meta.n2n_18_weight_26;
                bit<D_WORDSIZE> operand_a_18_27 = (bit<D_WORDSIZE>) meta.n2n_18_weight_27;
                bit<D_WORDSIZE> operand_a_18_28 = (bit<D_WORDSIZE>) meta.n2n_18_weight_28;
                bit<D_WORDSIZE> operand_a_18_29 = (bit<D_WORDSIZE>) meta.n2n_18_weight_29;
                bit<D_WORDSIZE> operand_a_18_30 = (bit<D_WORDSIZE>) meta.n2n_18_weight_30;
                bit<D_WORDSIZE> operand_a_18_31 = (bit<D_WORDSIZE>) meta.n2n_18_weight_31;
                bit<D_WORDSIZE> operand_a_18_32 = (bit<D_WORDSIZE>) meta.n2n_18_weight_32;
                // Sign extension
                if((operand_a_18_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_1;
                }
                if((operand_a_18_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_2;
                }
                if((operand_a_18_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_3;
                }
                if((operand_a_18_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_4;
                }
                if((operand_a_18_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_5;
                }
                if((operand_a_18_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_6;
                }
                if((operand_a_18_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_7;
                }
                if((operand_a_18_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_8;
                }
                if((operand_a_18_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_9;
                }
                if((operand_a_18_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_10;
                }
                if((operand_a_18_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_11;
                }
                if((operand_a_18_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_12;
                }
                if((operand_a_18_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_13;
                }
                if((operand_a_18_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_14;
                }
                if((operand_a_18_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_15;
                }
                if((operand_a_18_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_16;
                }
                if((operand_a_18_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_17;
                }
                if((operand_a_18_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_18;
                }
                if((operand_a_18_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_19;
                }
                if((operand_a_18_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_20;
                }
                if((operand_a_18_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_21;
                }
                if((operand_a_18_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_22;
                }
                if((operand_a_18_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_23;
                }
                if((operand_a_18_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_24;
                }
                if((operand_a_18_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_25;
                }
                if((operand_a_18_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_26;
                }
                if((operand_a_18_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_27;
                }
                if((operand_a_18_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_28;
                }
                if((operand_a_18_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_29;
                }
                if((operand_a_18_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_30;
                }
                if((operand_a_18_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_31;
                }
                if((operand_a_18_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_18_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_18_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_18_1 = ((operand_a_18_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_18_2 = ((operand_a_18_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_18_3 = ((operand_a_18_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_18_4 = ((operand_a_18_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_18_5 = ((operand_a_18_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_18_6 = ((operand_a_18_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_18_7 = ((operand_a_18_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_18_8 = ((operand_a_18_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_18_9 = ((operand_a_18_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_18_10 = ((operand_a_18_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_18_11 = ((operand_a_18_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_18_12 = ((operand_a_18_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_18_13 = ((operand_a_18_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_18_14 = ((operand_a_18_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_18_15 = ((operand_a_18_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_18_16 = ((operand_a_18_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_18_17 = ((operand_a_18_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_18_18 = ((operand_a_18_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_18_19 = ((operand_a_18_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_18_20 = ((operand_a_18_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_18_21 = ((operand_a_18_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_18_22 = ((operand_a_18_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_18_23 = ((operand_a_18_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_18_24 = ((operand_a_18_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_18_25 = ((operand_a_18_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_18_26 = ((operand_a_18_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_18_27 = ((operand_a_18_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_18_28 = ((operand_a_18_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_18_29 = ((operand_a_18_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_18_30 = ((operand_a_18_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_18_31 = ((operand_a_18_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_18_32 = ((operand_a_18_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_18_data = meta.neuron_18_data + (bit<WORDSIZE>) res_18_1 + (bit<WORDSIZE>) res_18_2 + (bit<WORDSIZE>) res_18_3 + (bit<WORDSIZE>) res_18_4 + (bit<WORDSIZE>) res_18_5 + (bit<WORDSIZE>) res_18_6 + (bit<WORDSIZE>) res_18_7 + (bit<WORDSIZE>) res_18_8 + (bit<WORDSIZE>) res_18_9 + (bit<WORDSIZE>) res_18_10 + (bit<WORDSIZE>) res_18_11 + (bit<WORDSIZE>) res_18_12 + (bit<WORDSIZE>) res_18_13 + (bit<WORDSIZE>) res_18_14 + (bit<WORDSIZE>) res_18_15 + (bit<WORDSIZE>) res_18_16 + (bit<WORDSIZE>) res_18_17 + (bit<WORDSIZE>) res_18_18 + (bit<WORDSIZE>) res_18_19 + (bit<WORDSIZE>) res_18_20 + (bit<WORDSIZE>) res_18_21 + (bit<WORDSIZE>) res_18_22 + (bit<WORDSIZE>) res_18_23 + (bit<WORDSIZE>) res_18_24 + (bit<WORDSIZE>) res_18_25 + (bit<WORDSIZE>) res_18_26 + (bit<WORDSIZE>) res_18_27 + (bit<WORDSIZE>) res_18_28 + (bit<WORDSIZE>) res_18_29 + (bit<WORDSIZE>) res_18_30 + (bit<WORDSIZE>) res_18_31 + (bit<WORDSIZE>) res_18_32;
                // Store data to be fowarded
                reg_neuron_18_data.write(0, meta.neuron_18_data);

                // Neuron 19:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_19_1 = (bit<D_WORDSIZE>) meta.n2n_19_weight_1;
                bit<D_WORDSIZE> operand_a_19_2 = (bit<D_WORDSIZE>) meta.n2n_19_weight_2;
                bit<D_WORDSIZE> operand_a_19_3 = (bit<D_WORDSIZE>) meta.n2n_19_weight_3;
                bit<D_WORDSIZE> operand_a_19_4 = (bit<D_WORDSIZE>) meta.n2n_19_weight_4;
                bit<D_WORDSIZE> operand_a_19_5 = (bit<D_WORDSIZE>) meta.n2n_19_weight_5;
                bit<D_WORDSIZE> operand_a_19_6 = (bit<D_WORDSIZE>) meta.n2n_19_weight_6;
                bit<D_WORDSIZE> operand_a_19_7 = (bit<D_WORDSIZE>) meta.n2n_19_weight_7;
                bit<D_WORDSIZE> operand_a_19_8 = (bit<D_WORDSIZE>) meta.n2n_19_weight_8;
                bit<D_WORDSIZE> operand_a_19_9 = (bit<D_WORDSIZE>) meta.n2n_19_weight_9;
                bit<D_WORDSIZE> operand_a_19_10 = (bit<D_WORDSIZE>) meta.n2n_19_weight_10;
                bit<D_WORDSIZE> operand_a_19_11 = (bit<D_WORDSIZE>) meta.n2n_19_weight_11;
                bit<D_WORDSIZE> operand_a_19_12 = (bit<D_WORDSIZE>) meta.n2n_19_weight_12;
                bit<D_WORDSIZE> operand_a_19_13 = (bit<D_WORDSIZE>) meta.n2n_19_weight_13;
                bit<D_WORDSIZE> operand_a_19_14 = (bit<D_WORDSIZE>) meta.n2n_19_weight_14;
                bit<D_WORDSIZE> operand_a_19_15 = (bit<D_WORDSIZE>) meta.n2n_19_weight_15;
                bit<D_WORDSIZE> operand_a_19_16 = (bit<D_WORDSIZE>) meta.n2n_19_weight_16;
                bit<D_WORDSIZE> operand_a_19_17 = (bit<D_WORDSIZE>) meta.n2n_19_weight_17;
                bit<D_WORDSIZE> operand_a_19_18 = (bit<D_WORDSIZE>) meta.n2n_19_weight_18;
                bit<D_WORDSIZE> operand_a_19_19 = (bit<D_WORDSIZE>) meta.n2n_19_weight_19;
                bit<D_WORDSIZE> operand_a_19_20 = (bit<D_WORDSIZE>) meta.n2n_19_weight_20;
                bit<D_WORDSIZE> operand_a_19_21 = (bit<D_WORDSIZE>) meta.n2n_19_weight_21;
                bit<D_WORDSIZE> operand_a_19_22 = (bit<D_WORDSIZE>) meta.n2n_19_weight_22;
                bit<D_WORDSIZE> operand_a_19_23 = (bit<D_WORDSIZE>) meta.n2n_19_weight_23;
                bit<D_WORDSIZE> operand_a_19_24 = (bit<D_WORDSIZE>) meta.n2n_19_weight_24;
                bit<D_WORDSIZE> operand_a_19_25 = (bit<D_WORDSIZE>) meta.n2n_19_weight_25;
                bit<D_WORDSIZE> operand_a_19_26 = (bit<D_WORDSIZE>) meta.n2n_19_weight_26;
                bit<D_WORDSIZE> operand_a_19_27 = (bit<D_WORDSIZE>) meta.n2n_19_weight_27;
                bit<D_WORDSIZE> operand_a_19_28 = (bit<D_WORDSIZE>) meta.n2n_19_weight_28;
                bit<D_WORDSIZE> operand_a_19_29 = (bit<D_WORDSIZE>) meta.n2n_19_weight_29;
                bit<D_WORDSIZE> operand_a_19_30 = (bit<D_WORDSIZE>) meta.n2n_19_weight_30;
                bit<D_WORDSIZE> operand_a_19_31 = (bit<D_WORDSIZE>) meta.n2n_19_weight_31;
                bit<D_WORDSIZE> operand_a_19_32 = (bit<D_WORDSIZE>) meta.n2n_19_weight_32;
                // Sign extension
                if((operand_a_19_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_1;
                }
                if((operand_a_19_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_2;
                }
                if((operand_a_19_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_3;
                }
                if((operand_a_19_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_4;
                }
                if((operand_a_19_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_5;
                }
                if((operand_a_19_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_6;
                }
                if((operand_a_19_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_7;
                }
                if((operand_a_19_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_8;
                }
                if((operand_a_19_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_9;
                }
                if((operand_a_19_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_10;
                }
                if((operand_a_19_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_11;
                }
                if((operand_a_19_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_12;
                }
                if((operand_a_19_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_13;
                }
                if((operand_a_19_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_14;
                }
                if((operand_a_19_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_15;
                }
                if((operand_a_19_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_16;
                }
                if((operand_a_19_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_17;
                }
                if((operand_a_19_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_18;
                }
                if((operand_a_19_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_19;
                }
                if((operand_a_19_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_20;
                }
                if((operand_a_19_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_21;
                }
                if((operand_a_19_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_22;
                }
                if((operand_a_19_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_23;
                }
                if((operand_a_19_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_24;
                }
                if((operand_a_19_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_25;
                }
                if((operand_a_19_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_26;
                }
                if((operand_a_19_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_27;
                }
                if((operand_a_19_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_28;
                }
                if((operand_a_19_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_29;
                }
                if((operand_a_19_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_30;
                }
                if((operand_a_19_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_31;
                }
                if((operand_a_19_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_19_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_19_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_19_1 = ((operand_a_19_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_19_2 = ((operand_a_19_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_19_3 = ((operand_a_19_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_19_4 = ((operand_a_19_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_19_5 = ((operand_a_19_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_19_6 = ((operand_a_19_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_19_7 = ((operand_a_19_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_19_8 = ((operand_a_19_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_19_9 = ((operand_a_19_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_19_10 = ((operand_a_19_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_19_11 = ((operand_a_19_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_19_12 = ((operand_a_19_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_19_13 = ((operand_a_19_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_19_14 = ((operand_a_19_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_19_15 = ((operand_a_19_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_19_16 = ((operand_a_19_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_19_17 = ((operand_a_19_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_19_18 = ((operand_a_19_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_19_19 = ((operand_a_19_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_19_20 = ((operand_a_19_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_19_21 = ((operand_a_19_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_19_22 = ((operand_a_19_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_19_23 = ((operand_a_19_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_19_24 = ((operand_a_19_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_19_25 = ((operand_a_19_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_19_26 = ((operand_a_19_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_19_27 = ((operand_a_19_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_19_28 = ((operand_a_19_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_19_29 = ((operand_a_19_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_19_30 = ((operand_a_19_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_19_31 = ((operand_a_19_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_19_32 = ((operand_a_19_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_19_data = meta.neuron_19_data + (bit<WORDSIZE>) res_19_1 + (bit<WORDSIZE>) res_19_2 + (bit<WORDSIZE>) res_19_3 + (bit<WORDSIZE>) res_19_4 + (bit<WORDSIZE>) res_19_5 + (bit<WORDSIZE>) res_19_6 + (bit<WORDSIZE>) res_19_7 + (bit<WORDSIZE>) res_19_8 + (bit<WORDSIZE>) res_19_9 + (bit<WORDSIZE>) res_19_10 + (bit<WORDSIZE>) res_19_11 + (bit<WORDSIZE>) res_19_12 + (bit<WORDSIZE>) res_19_13 + (bit<WORDSIZE>) res_19_14 + (bit<WORDSIZE>) res_19_15 + (bit<WORDSIZE>) res_19_16 + (bit<WORDSIZE>) res_19_17 + (bit<WORDSIZE>) res_19_18 + (bit<WORDSIZE>) res_19_19 + (bit<WORDSIZE>) res_19_20 + (bit<WORDSIZE>) res_19_21 + (bit<WORDSIZE>) res_19_22 + (bit<WORDSIZE>) res_19_23 + (bit<WORDSIZE>) res_19_24 + (bit<WORDSIZE>) res_19_25 + (bit<WORDSIZE>) res_19_26 + (bit<WORDSIZE>) res_19_27 + (bit<WORDSIZE>) res_19_28 + (bit<WORDSIZE>) res_19_29 + (bit<WORDSIZE>) res_19_30 + (bit<WORDSIZE>) res_19_31 + (bit<WORDSIZE>) res_19_32;
                // Store data to be fowarded
                reg_neuron_19_data.write(0, meta.neuron_19_data);

                // Neuron 20:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_20_1 = (bit<D_WORDSIZE>) meta.n2n_20_weight_1;
                bit<D_WORDSIZE> operand_a_20_2 = (bit<D_WORDSIZE>) meta.n2n_20_weight_2;
                bit<D_WORDSIZE> operand_a_20_3 = (bit<D_WORDSIZE>) meta.n2n_20_weight_3;
                bit<D_WORDSIZE> operand_a_20_4 = (bit<D_WORDSIZE>) meta.n2n_20_weight_4;
                bit<D_WORDSIZE> operand_a_20_5 = (bit<D_WORDSIZE>) meta.n2n_20_weight_5;
                bit<D_WORDSIZE> operand_a_20_6 = (bit<D_WORDSIZE>) meta.n2n_20_weight_6;
                bit<D_WORDSIZE> operand_a_20_7 = (bit<D_WORDSIZE>) meta.n2n_20_weight_7;
                bit<D_WORDSIZE> operand_a_20_8 = (bit<D_WORDSIZE>) meta.n2n_20_weight_8;
                bit<D_WORDSIZE> operand_a_20_9 = (bit<D_WORDSIZE>) meta.n2n_20_weight_9;
                bit<D_WORDSIZE> operand_a_20_10 = (bit<D_WORDSIZE>) meta.n2n_20_weight_10;
                bit<D_WORDSIZE> operand_a_20_11 = (bit<D_WORDSIZE>) meta.n2n_20_weight_11;
                bit<D_WORDSIZE> operand_a_20_12 = (bit<D_WORDSIZE>) meta.n2n_20_weight_12;
                bit<D_WORDSIZE> operand_a_20_13 = (bit<D_WORDSIZE>) meta.n2n_20_weight_13;
                bit<D_WORDSIZE> operand_a_20_14 = (bit<D_WORDSIZE>) meta.n2n_20_weight_14;
                bit<D_WORDSIZE> operand_a_20_15 = (bit<D_WORDSIZE>) meta.n2n_20_weight_15;
                bit<D_WORDSIZE> operand_a_20_16 = (bit<D_WORDSIZE>) meta.n2n_20_weight_16;
                bit<D_WORDSIZE> operand_a_20_17 = (bit<D_WORDSIZE>) meta.n2n_20_weight_17;
                bit<D_WORDSIZE> operand_a_20_18 = (bit<D_WORDSIZE>) meta.n2n_20_weight_18;
                bit<D_WORDSIZE> operand_a_20_19 = (bit<D_WORDSIZE>) meta.n2n_20_weight_19;
                bit<D_WORDSIZE> operand_a_20_20 = (bit<D_WORDSIZE>) meta.n2n_20_weight_20;
                bit<D_WORDSIZE> operand_a_20_21 = (bit<D_WORDSIZE>) meta.n2n_20_weight_21;
                bit<D_WORDSIZE> operand_a_20_22 = (bit<D_WORDSIZE>) meta.n2n_20_weight_22;
                bit<D_WORDSIZE> operand_a_20_23 = (bit<D_WORDSIZE>) meta.n2n_20_weight_23;
                bit<D_WORDSIZE> operand_a_20_24 = (bit<D_WORDSIZE>) meta.n2n_20_weight_24;
                bit<D_WORDSIZE> operand_a_20_25 = (bit<D_WORDSIZE>) meta.n2n_20_weight_25;
                bit<D_WORDSIZE> operand_a_20_26 = (bit<D_WORDSIZE>) meta.n2n_20_weight_26;
                bit<D_WORDSIZE> operand_a_20_27 = (bit<D_WORDSIZE>) meta.n2n_20_weight_27;
                bit<D_WORDSIZE> operand_a_20_28 = (bit<D_WORDSIZE>) meta.n2n_20_weight_28;
                bit<D_WORDSIZE> operand_a_20_29 = (bit<D_WORDSIZE>) meta.n2n_20_weight_29;
                bit<D_WORDSIZE> operand_a_20_30 = (bit<D_WORDSIZE>) meta.n2n_20_weight_30;
                bit<D_WORDSIZE> operand_a_20_31 = (bit<D_WORDSIZE>) meta.n2n_20_weight_31;
                bit<D_WORDSIZE> operand_a_20_32 = (bit<D_WORDSIZE>) meta.n2n_20_weight_32;
                // Sign extension
                if((operand_a_20_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_1;
                }
                if((operand_a_20_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_2;
                }
                if((operand_a_20_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_3;
                }
                if((operand_a_20_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_4;
                }
                if((operand_a_20_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_5;
                }
                if((operand_a_20_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_6;
                }
                if((operand_a_20_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_7;
                }
                if((operand_a_20_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_8;
                }
                if((operand_a_20_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_9;
                }
                if((operand_a_20_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_10;
                }
                if((operand_a_20_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_11;
                }
                if((operand_a_20_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_12;
                }
                if((operand_a_20_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_13;
                }
                if((operand_a_20_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_14;
                }
                if((operand_a_20_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_15;
                }
                if((operand_a_20_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_16;
                }
                if((operand_a_20_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_17;
                }
                if((operand_a_20_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_18;
                }
                if((operand_a_20_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_19;
                }
                if((operand_a_20_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_20;
                }
                if((operand_a_20_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_21;
                }
                if((operand_a_20_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_22;
                }
                if((operand_a_20_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_23;
                }
                if((operand_a_20_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_24;
                }
                if((operand_a_20_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_25;
                }
                if((operand_a_20_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_26;
                }
                if((operand_a_20_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_27;
                }
                if((operand_a_20_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_28;
                }
                if((operand_a_20_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_29;
                }
                if((operand_a_20_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_30;
                }
                if((operand_a_20_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_31;
                }
                if((operand_a_20_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_20_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_20_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_20_1 = ((operand_a_20_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_20_2 = ((operand_a_20_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_20_3 = ((operand_a_20_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_20_4 = ((operand_a_20_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_20_5 = ((operand_a_20_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_20_6 = ((operand_a_20_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_20_7 = ((operand_a_20_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_20_8 = ((operand_a_20_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_20_9 = ((operand_a_20_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_20_10 = ((operand_a_20_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_20_11 = ((operand_a_20_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_20_12 = ((operand_a_20_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_20_13 = ((operand_a_20_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_20_14 = ((operand_a_20_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_20_15 = ((operand_a_20_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_20_16 = ((operand_a_20_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_20_17 = ((operand_a_20_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_20_18 = ((operand_a_20_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_20_19 = ((operand_a_20_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_20_20 = ((operand_a_20_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_20_21 = ((operand_a_20_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_20_22 = ((operand_a_20_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_20_23 = ((operand_a_20_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_20_24 = ((operand_a_20_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_20_25 = ((operand_a_20_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_20_26 = ((operand_a_20_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_20_27 = ((operand_a_20_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_20_28 = ((operand_a_20_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_20_29 = ((operand_a_20_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_20_30 = ((operand_a_20_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_20_31 = ((operand_a_20_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_20_32 = ((operand_a_20_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_20_data = meta.neuron_20_data + (bit<WORDSIZE>) res_20_1 + (bit<WORDSIZE>) res_20_2 + (bit<WORDSIZE>) res_20_3 + (bit<WORDSIZE>) res_20_4 + (bit<WORDSIZE>) res_20_5 + (bit<WORDSIZE>) res_20_6 + (bit<WORDSIZE>) res_20_7 + (bit<WORDSIZE>) res_20_8 + (bit<WORDSIZE>) res_20_9 + (bit<WORDSIZE>) res_20_10 + (bit<WORDSIZE>) res_20_11 + (bit<WORDSIZE>) res_20_12 + (bit<WORDSIZE>) res_20_13 + (bit<WORDSIZE>) res_20_14 + (bit<WORDSIZE>) res_20_15 + (bit<WORDSIZE>) res_20_16 + (bit<WORDSIZE>) res_20_17 + (bit<WORDSIZE>) res_20_18 + (bit<WORDSIZE>) res_20_19 + (bit<WORDSIZE>) res_20_20 + (bit<WORDSIZE>) res_20_21 + (bit<WORDSIZE>) res_20_22 + (bit<WORDSIZE>) res_20_23 + (bit<WORDSIZE>) res_20_24 + (bit<WORDSIZE>) res_20_25 + (bit<WORDSIZE>) res_20_26 + (bit<WORDSIZE>) res_20_27 + (bit<WORDSIZE>) res_20_28 + (bit<WORDSIZE>) res_20_29 + (bit<WORDSIZE>) res_20_30 + (bit<WORDSIZE>) res_20_31 + (bit<WORDSIZE>) res_20_32;
                // Store data to be fowarded
                reg_neuron_20_data.write(0, meta.neuron_20_data);

                // Neuron 21:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_21_1 = (bit<D_WORDSIZE>) meta.n2n_21_weight_1;
                bit<D_WORDSIZE> operand_a_21_2 = (bit<D_WORDSIZE>) meta.n2n_21_weight_2;
                bit<D_WORDSIZE> operand_a_21_3 = (bit<D_WORDSIZE>) meta.n2n_21_weight_3;
                bit<D_WORDSIZE> operand_a_21_4 = (bit<D_WORDSIZE>) meta.n2n_21_weight_4;
                bit<D_WORDSIZE> operand_a_21_5 = (bit<D_WORDSIZE>) meta.n2n_21_weight_5;
                bit<D_WORDSIZE> operand_a_21_6 = (bit<D_WORDSIZE>) meta.n2n_21_weight_6;
                bit<D_WORDSIZE> operand_a_21_7 = (bit<D_WORDSIZE>) meta.n2n_21_weight_7;
                bit<D_WORDSIZE> operand_a_21_8 = (bit<D_WORDSIZE>) meta.n2n_21_weight_8;
                bit<D_WORDSIZE> operand_a_21_9 = (bit<D_WORDSIZE>) meta.n2n_21_weight_9;
                bit<D_WORDSIZE> operand_a_21_10 = (bit<D_WORDSIZE>) meta.n2n_21_weight_10;
                bit<D_WORDSIZE> operand_a_21_11 = (bit<D_WORDSIZE>) meta.n2n_21_weight_11;
                bit<D_WORDSIZE> operand_a_21_12 = (bit<D_WORDSIZE>) meta.n2n_21_weight_12;
                bit<D_WORDSIZE> operand_a_21_13 = (bit<D_WORDSIZE>) meta.n2n_21_weight_13;
                bit<D_WORDSIZE> operand_a_21_14 = (bit<D_WORDSIZE>) meta.n2n_21_weight_14;
                bit<D_WORDSIZE> operand_a_21_15 = (bit<D_WORDSIZE>) meta.n2n_21_weight_15;
                bit<D_WORDSIZE> operand_a_21_16 = (bit<D_WORDSIZE>) meta.n2n_21_weight_16;
                bit<D_WORDSIZE> operand_a_21_17 = (bit<D_WORDSIZE>) meta.n2n_21_weight_17;
                bit<D_WORDSIZE> operand_a_21_18 = (bit<D_WORDSIZE>) meta.n2n_21_weight_18;
                bit<D_WORDSIZE> operand_a_21_19 = (bit<D_WORDSIZE>) meta.n2n_21_weight_19;
                bit<D_WORDSIZE> operand_a_21_20 = (bit<D_WORDSIZE>) meta.n2n_21_weight_20;
                bit<D_WORDSIZE> operand_a_21_21 = (bit<D_WORDSIZE>) meta.n2n_21_weight_21;
                bit<D_WORDSIZE> operand_a_21_22 = (bit<D_WORDSIZE>) meta.n2n_21_weight_22;
                bit<D_WORDSIZE> operand_a_21_23 = (bit<D_WORDSIZE>) meta.n2n_21_weight_23;
                bit<D_WORDSIZE> operand_a_21_24 = (bit<D_WORDSIZE>) meta.n2n_21_weight_24;
                bit<D_WORDSIZE> operand_a_21_25 = (bit<D_WORDSIZE>) meta.n2n_21_weight_25;
                bit<D_WORDSIZE> operand_a_21_26 = (bit<D_WORDSIZE>) meta.n2n_21_weight_26;
                bit<D_WORDSIZE> operand_a_21_27 = (bit<D_WORDSIZE>) meta.n2n_21_weight_27;
                bit<D_WORDSIZE> operand_a_21_28 = (bit<D_WORDSIZE>) meta.n2n_21_weight_28;
                bit<D_WORDSIZE> operand_a_21_29 = (bit<D_WORDSIZE>) meta.n2n_21_weight_29;
                bit<D_WORDSIZE> operand_a_21_30 = (bit<D_WORDSIZE>) meta.n2n_21_weight_30;
                bit<D_WORDSIZE> operand_a_21_31 = (bit<D_WORDSIZE>) meta.n2n_21_weight_31;
                bit<D_WORDSIZE> operand_a_21_32 = (bit<D_WORDSIZE>) meta.n2n_21_weight_32;
                // Sign extension
                if((operand_a_21_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_1;
                }
                if((operand_a_21_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_2;
                }
                if((operand_a_21_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_3;
                }
                if((operand_a_21_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_4;
                }
                if((operand_a_21_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_5;
                }
                if((operand_a_21_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_6;
                }
                if((operand_a_21_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_7;
                }
                if((operand_a_21_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_8;
                }
                if((operand_a_21_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_9;
                }
                if((operand_a_21_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_10;
                }
                if((operand_a_21_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_11;
                }
                if((operand_a_21_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_12;
                }
                if((operand_a_21_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_13;
                }
                if((operand_a_21_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_14;
                }
                if((operand_a_21_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_15;
                }
                if((operand_a_21_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_16;
                }
                if((operand_a_21_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_17;
                }
                if((operand_a_21_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_18;
                }
                if((operand_a_21_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_19;
                }
                if((operand_a_21_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_20;
                }
                if((operand_a_21_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_21;
                }
                if((operand_a_21_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_22;
                }
                if((operand_a_21_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_23;
                }
                if((operand_a_21_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_24;
                }
                if((operand_a_21_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_25;
                }
                if((operand_a_21_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_26;
                }
                if((operand_a_21_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_27;
                }
                if((operand_a_21_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_28;
                }
                if((operand_a_21_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_29;
                }
                if((operand_a_21_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_30;
                }
                if((operand_a_21_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_31;
                }
                if((operand_a_21_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_21_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_21_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_21_1 = ((operand_a_21_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_21_2 = ((operand_a_21_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_21_3 = ((operand_a_21_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_21_4 = ((operand_a_21_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_21_5 = ((operand_a_21_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_21_6 = ((operand_a_21_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_21_7 = ((operand_a_21_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_21_8 = ((operand_a_21_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_21_9 = ((operand_a_21_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_21_10 = ((operand_a_21_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_21_11 = ((operand_a_21_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_21_12 = ((operand_a_21_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_21_13 = ((operand_a_21_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_21_14 = ((operand_a_21_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_21_15 = ((operand_a_21_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_21_16 = ((operand_a_21_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_21_17 = ((operand_a_21_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_21_18 = ((operand_a_21_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_21_19 = ((operand_a_21_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_21_20 = ((operand_a_21_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_21_21 = ((operand_a_21_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_21_22 = ((operand_a_21_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_21_23 = ((operand_a_21_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_21_24 = ((operand_a_21_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_21_25 = ((operand_a_21_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_21_26 = ((operand_a_21_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_21_27 = ((operand_a_21_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_21_28 = ((operand_a_21_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_21_29 = ((operand_a_21_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_21_30 = ((operand_a_21_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_21_31 = ((operand_a_21_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_21_32 = ((operand_a_21_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_21_data = meta.neuron_21_data + (bit<WORDSIZE>) res_21_1 + (bit<WORDSIZE>) res_21_2 + (bit<WORDSIZE>) res_21_3 + (bit<WORDSIZE>) res_21_4 + (bit<WORDSIZE>) res_21_5 + (bit<WORDSIZE>) res_21_6 + (bit<WORDSIZE>) res_21_7 + (bit<WORDSIZE>) res_21_8 + (bit<WORDSIZE>) res_21_9 + (bit<WORDSIZE>) res_21_10 + (bit<WORDSIZE>) res_21_11 + (bit<WORDSIZE>) res_21_12 + (bit<WORDSIZE>) res_21_13 + (bit<WORDSIZE>) res_21_14 + (bit<WORDSIZE>) res_21_15 + (bit<WORDSIZE>) res_21_16 + (bit<WORDSIZE>) res_21_17 + (bit<WORDSIZE>) res_21_18 + (bit<WORDSIZE>) res_21_19 + (bit<WORDSIZE>) res_21_20 + (bit<WORDSIZE>) res_21_21 + (bit<WORDSIZE>) res_21_22 + (bit<WORDSIZE>) res_21_23 + (bit<WORDSIZE>) res_21_24 + (bit<WORDSIZE>) res_21_25 + (bit<WORDSIZE>) res_21_26 + (bit<WORDSIZE>) res_21_27 + (bit<WORDSIZE>) res_21_28 + (bit<WORDSIZE>) res_21_29 + (bit<WORDSIZE>) res_21_30 + (bit<WORDSIZE>) res_21_31 + (bit<WORDSIZE>) res_21_32;
                // Store data to be fowarded
                reg_neuron_21_data.write(0, meta.neuron_21_data);

                // Neuron 22:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_22_1 = (bit<D_WORDSIZE>) meta.n2n_22_weight_1;
                bit<D_WORDSIZE> operand_a_22_2 = (bit<D_WORDSIZE>) meta.n2n_22_weight_2;
                bit<D_WORDSIZE> operand_a_22_3 = (bit<D_WORDSIZE>) meta.n2n_22_weight_3;
                bit<D_WORDSIZE> operand_a_22_4 = (bit<D_WORDSIZE>) meta.n2n_22_weight_4;
                bit<D_WORDSIZE> operand_a_22_5 = (bit<D_WORDSIZE>) meta.n2n_22_weight_5;
                bit<D_WORDSIZE> operand_a_22_6 = (bit<D_WORDSIZE>) meta.n2n_22_weight_6;
                bit<D_WORDSIZE> operand_a_22_7 = (bit<D_WORDSIZE>) meta.n2n_22_weight_7;
                bit<D_WORDSIZE> operand_a_22_8 = (bit<D_WORDSIZE>) meta.n2n_22_weight_8;
                bit<D_WORDSIZE> operand_a_22_9 = (bit<D_WORDSIZE>) meta.n2n_22_weight_9;
                bit<D_WORDSIZE> operand_a_22_10 = (bit<D_WORDSIZE>) meta.n2n_22_weight_10;
                bit<D_WORDSIZE> operand_a_22_11 = (bit<D_WORDSIZE>) meta.n2n_22_weight_11;
                bit<D_WORDSIZE> operand_a_22_12 = (bit<D_WORDSIZE>) meta.n2n_22_weight_12;
                bit<D_WORDSIZE> operand_a_22_13 = (bit<D_WORDSIZE>) meta.n2n_22_weight_13;
                bit<D_WORDSIZE> operand_a_22_14 = (bit<D_WORDSIZE>) meta.n2n_22_weight_14;
                bit<D_WORDSIZE> operand_a_22_15 = (bit<D_WORDSIZE>) meta.n2n_22_weight_15;
                bit<D_WORDSIZE> operand_a_22_16 = (bit<D_WORDSIZE>) meta.n2n_22_weight_16;
                bit<D_WORDSIZE> operand_a_22_17 = (bit<D_WORDSIZE>) meta.n2n_22_weight_17;
                bit<D_WORDSIZE> operand_a_22_18 = (bit<D_WORDSIZE>) meta.n2n_22_weight_18;
                bit<D_WORDSIZE> operand_a_22_19 = (bit<D_WORDSIZE>) meta.n2n_22_weight_19;
                bit<D_WORDSIZE> operand_a_22_20 = (bit<D_WORDSIZE>) meta.n2n_22_weight_20;
                bit<D_WORDSIZE> operand_a_22_21 = (bit<D_WORDSIZE>) meta.n2n_22_weight_21;
                bit<D_WORDSIZE> operand_a_22_22 = (bit<D_WORDSIZE>) meta.n2n_22_weight_22;
                bit<D_WORDSIZE> operand_a_22_23 = (bit<D_WORDSIZE>) meta.n2n_22_weight_23;
                bit<D_WORDSIZE> operand_a_22_24 = (bit<D_WORDSIZE>) meta.n2n_22_weight_24;
                bit<D_WORDSIZE> operand_a_22_25 = (bit<D_WORDSIZE>) meta.n2n_22_weight_25;
                bit<D_WORDSIZE> operand_a_22_26 = (bit<D_WORDSIZE>) meta.n2n_22_weight_26;
                bit<D_WORDSIZE> operand_a_22_27 = (bit<D_WORDSIZE>) meta.n2n_22_weight_27;
                bit<D_WORDSIZE> operand_a_22_28 = (bit<D_WORDSIZE>) meta.n2n_22_weight_28;
                bit<D_WORDSIZE> operand_a_22_29 = (bit<D_WORDSIZE>) meta.n2n_22_weight_29;
                bit<D_WORDSIZE> operand_a_22_30 = (bit<D_WORDSIZE>) meta.n2n_22_weight_30;
                bit<D_WORDSIZE> operand_a_22_31 = (bit<D_WORDSIZE>) meta.n2n_22_weight_31;
                bit<D_WORDSIZE> operand_a_22_32 = (bit<D_WORDSIZE>) meta.n2n_22_weight_32;
                // Sign extension
                if((operand_a_22_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_1;
                }
                if((operand_a_22_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_2;
                }
                if((operand_a_22_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_3;
                }
                if((operand_a_22_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_4;
                }
                if((operand_a_22_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_5;
                }
                if((operand_a_22_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_6;
                }
                if((operand_a_22_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_7;
                }
                if((operand_a_22_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_8;
                }
                if((operand_a_22_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_9;
                }
                if((operand_a_22_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_10;
                }
                if((operand_a_22_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_11;
                }
                if((operand_a_22_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_12;
                }
                if((operand_a_22_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_13;
                }
                if((operand_a_22_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_14;
                }
                if((operand_a_22_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_15;
                }
                if((operand_a_22_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_16;
                }
                if((operand_a_22_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_17;
                }
                if((operand_a_22_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_18;
                }
                if((operand_a_22_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_19;
                }
                if((operand_a_22_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_20;
                }
                if((operand_a_22_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_21;
                }
                if((operand_a_22_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_22;
                }
                if((operand_a_22_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_23;
                }
                if((operand_a_22_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_24;
                }
                if((operand_a_22_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_25;
                }
                if((operand_a_22_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_26;
                }
                if((operand_a_22_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_27;
                }
                if((operand_a_22_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_28;
                }
                if((operand_a_22_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_29;
                }
                if((operand_a_22_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_30;
                }
                if((operand_a_22_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_31;
                }
                if((operand_a_22_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_22_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_22_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_22_1 = ((operand_a_22_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_22_2 = ((operand_a_22_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_22_3 = ((operand_a_22_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_22_4 = ((operand_a_22_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_22_5 = ((operand_a_22_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_22_6 = ((operand_a_22_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_22_7 = ((operand_a_22_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_22_8 = ((operand_a_22_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_22_9 = ((operand_a_22_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_22_10 = ((operand_a_22_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_22_11 = ((operand_a_22_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_22_12 = ((operand_a_22_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_22_13 = ((operand_a_22_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_22_14 = ((operand_a_22_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_22_15 = ((operand_a_22_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_22_16 = ((operand_a_22_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_22_17 = ((operand_a_22_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_22_18 = ((operand_a_22_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_22_19 = ((operand_a_22_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_22_20 = ((operand_a_22_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_22_21 = ((operand_a_22_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_22_22 = ((operand_a_22_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_22_23 = ((operand_a_22_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_22_24 = ((operand_a_22_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_22_25 = ((operand_a_22_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_22_26 = ((operand_a_22_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_22_27 = ((operand_a_22_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_22_28 = ((operand_a_22_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_22_29 = ((operand_a_22_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_22_30 = ((operand_a_22_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_22_31 = ((operand_a_22_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_22_32 = ((operand_a_22_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_22_data = meta.neuron_22_data + (bit<WORDSIZE>) res_22_1 + (bit<WORDSIZE>) res_22_2 + (bit<WORDSIZE>) res_22_3 + (bit<WORDSIZE>) res_22_4 + (bit<WORDSIZE>) res_22_5 + (bit<WORDSIZE>) res_22_6 + (bit<WORDSIZE>) res_22_7 + (bit<WORDSIZE>) res_22_8 + (bit<WORDSIZE>) res_22_9 + (bit<WORDSIZE>) res_22_10 + (bit<WORDSIZE>) res_22_11 + (bit<WORDSIZE>) res_22_12 + (bit<WORDSIZE>) res_22_13 + (bit<WORDSIZE>) res_22_14 + (bit<WORDSIZE>) res_22_15 + (bit<WORDSIZE>) res_22_16 + (bit<WORDSIZE>) res_22_17 + (bit<WORDSIZE>) res_22_18 + (bit<WORDSIZE>) res_22_19 + (bit<WORDSIZE>) res_22_20 + (bit<WORDSIZE>) res_22_21 + (bit<WORDSIZE>) res_22_22 + (bit<WORDSIZE>) res_22_23 + (bit<WORDSIZE>) res_22_24 + (bit<WORDSIZE>) res_22_25 + (bit<WORDSIZE>) res_22_26 + (bit<WORDSIZE>) res_22_27 + (bit<WORDSIZE>) res_22_28 + (bit<WORDSIZE>) res_22_29 + (bit<WORDSIZE>) res_22_30 + (bit<WORDSIZE>) res_22_31 + (bit<WORDSIZE>) res_22_32;
                // Store data to be fowarded
                reg_neuron_22_data.write(0, meta.neuron_22_data);

                // Neuron 23:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_23_1 = (bit<D_WORDSIZE>) meta.n2n_23_weight_1;
                bit<D_WORDSIZE> operand_a_23_2 = (bit<D_WORDSIZE>) meta.n2n_23_weight_2;
                bit<D_WORDSIZE> operand_a_23_3 = (bit<D_WORDSIZE>) meta.n2n_23_weight_3;
                bit<D_WORDSIZE> operand_a_23_4 = (bit<D_WORDSIZE>) meta.n2n_23_weight_4;
                bit<D_WORDSIZE> operand_a_23_5 = (bit<D_WORDSIZE>) meta.n2n_23_weight_5;
                bit<D_WORDSIZE> operand_a_23_6 = (bit<D_WORDSIZE>) meta.n2n_23_weight_6;
                bit<D_WORDSIZE> operand_a_23_7 = (bit<D_WORDSIZE>) meta.n2n_23_weight_7;
                bit<D_WORDSIZE> operand_a_23_8 = (bit<D_WORDSIZE>) meta.n2n_23_weight_8;
                bit<D_WORDSIZE> operand_a_23_9 = (bit<D_WORDSIZE>) meta.n2n_23_weight_9;
                bit<D_WORDSIZE> operand_a_23_10 = (bit<D_WORDSIZE>) meta.n2n_23_weight_10;
                bit<D_WORDSIZE> operand_a_23_11 = (bit<D_WORDSIZE>) meta.n2n_23_weight_11;
                bit<D_WORDSIZE> operand_a_23_12 = (bit<D_WORDSIZE>) meta.n2n_23_weight_12;
                bit<D_WORDSIZE> operand_a_23_13 = (bit<D_WORDSIZE>) meta.n2n_23_weight_13;
                bit<D_WORDSIZE> operand_a_23_14 = (bit<D_WORDSIZE>) meta.n2n_23_weight_14;
                bit<D_WORDSIZE> operand_a_23_15 = (bit<D_WORDSIZE>) meta.n2n_23_weight_15;
                bit<D_WORDSIZE> operand_a_23_16 = (bit<D_WORDSIZE>) meta.n2n_23_weight_16;
                bit<D_WORDSIZE> operand_a_23_17 = (bit<D_WORDSIZE>) meta.n2n_23_weight_17;
                bit<D_WORDSIZE> operand_a_23_18 = (bit<D_WORDSIZE>) meta.n2n_23_weight_18;
                bit<D_WORDSIZE> operand_a_23_19 = (bit<D_WORDSIZE>) meta.n2n_23_weight_19;
                bit<D_WORDSIZE> operand_a_23_20 = (bit<D_WORDSIZE>) meta.n2n_23_weight_20;
                bit<D_WORDSIZE> operand_a_23_21 = (bit<D_WORDSIZE>) meta.n2n_23_weight_21;
                bit<D_WORDSIZE> operand_a_23_22 = (bit<D_WORDSIZE>) meta.n2n_23_weight_22;
                bit<D_WORDSIZE> operand_a_23_23 = (bit<D_WORDSIZE>) meta.n2n_23_weight_23;
                bit<D_WORDSIZE> operand_a_23_24 = (bit<D_WORDSIZE>) meta.n2n_23_weight_24;
                bit<D_WORDSIZE> operand_a_23_25 = (bit<D_WORDSIZE>) meta.n2n_23_weight_25;
                bit<D_WORDSIZE> operand_a_23_26 = (bit<D_WORDSIZE>) meta.n2n_23_weight_26;
                bit<D_WORDSIZE> operand_a_23_27 = (bit<D_WORDSIZE>) meta.n2n_23_weight_27;
                bit<D_WORDSIZE> operand_a_23_28 = (bit<D_WORDSIZE>) meta.n2n_23_weight_28;
                bit<D_WORDSIZE> operand_a_23_29 = (bit<D_WORDSIZE>) meta.n2n_23_weight_29;
                bit<D_WORDSIZE> operand_a_23_30 = (bit<D_WORDSIZE>) meta.n2n_23_weight_30;
                bit<D_WORDSIZE> operand_a_23_31 = (bit<D_WORDSIZE>) meta.n2n_23_weight_31;
                bit<D_WORDSIZE> operand_a_23_32 = (bit<D_WORDSIZE>) meta.n2n_23_weight_32;
                // Sign extension
                if((operand_a_23_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_1;
                }
                if((operand_a_23_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_2;
                }
                if((operand_a_23_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_3;
                }
                if((operand_a_23_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_4;
                }
                if((operand_a_23_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_5;
                }
                if((operand_a_23_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_6;
                }
                if((operand_a_23_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_7;
                }
                if((operand_a_23_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_8;
                }
                if((operand_a_23_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_9;
                }
                if((operand_a_23_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_10;
                }
                if((operand_a_23_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_11;
                }
                if((operand_a_23_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_12;
                }
                if((operand_a_23_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_13;
                }
                if((operand_a_23_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_14;
                }
                if((operand_a_23_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_15;
                }
                if((operand_a_23_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_16;
                }
                if((operand_a_23_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_17;
                }
                if((operand_a_23_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_18;
                }
                if((operand_a_23_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_19;
                }
                if((operand_a_23_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_20;
                }
                if((operand_a_23_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_21;
                }
                if((operand_a_23_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_22;
                }
                if((operand_a_23_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_23;
                }
                if((operand_a_23_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_24;
                }
                if((operand_a_23_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_25;
                }
                if((operand_a_23_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_26;
                }
                if((operand_a_23_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_27;
                }
                if((operand_a_23_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_28;
                }
                if((operand_a_23_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_29;
                }
                if((operand_a_23_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_30;
                }
                if((operand_a_23_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_31;
                }
                if((operand_a_23_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_23_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_23_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_23_1 = ((operand_a_23_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_23_2 = ((operand_a_23_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_23_3 = ((operand_a_23_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_23_4 = ((operand_a_23_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_23_5 = ((operand_a_23_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_23_6 = ((operand_a_23_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_23_7 = ((operand_a_23_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_23_8 = ((operand_a_23_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_23_9 = ((operand_a_23_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_23_10 = ((operand_a_23_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_23_11 = ((operand_a_23_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_23_12 = ((operand_a_23_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_23_13 = ((operand_a_23_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_23_14 = ((operand_a_23_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_23_15 = ((operand_a_23_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_23_16 = ((operand_a_23_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_23_17 = ((operand_a_23_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_23_18 = ((operand_a_23_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_23_19 = ((operand_a_23_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_23_20 = ((operand_a_23_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_23_21 = ((operand_a_23_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_23_22 = ((operand_a_23_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_23_23 = ((operand_a_23_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_23_24 = ((operand_a_23_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_23_25 = ((operand_a_23_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_23_26 = ((operand_a_23_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_23_27 = ((operand_a_23_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_23_28 = ((operand_a_23_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_23_29 = ((operand_a_23_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_23_30 = ((operand_a_23_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_23_31 = ((operand_a_23_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_23_32 = ((operand_a_23_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_23_data = meta.neuron_23_data + (bit<WORDSIZE>) res_23_1 + (bit<WORDSIZE>) res_23_2 + (bit<WORDSIZE>) res_23_3 + (bit<WORDSIZE>) res_23_4 + (bit<WORDSIZE>) res_23_5 + (bit<WORDSIZE>) res_23_6 + (bit<WORDSIZE>) res_23_7 + (bit<WORDSIZE>) res_23_8 + (bit<WORDSIZE>) res_23_9 + (bit<WORDSIZE>) res_23_10 + (bit<WORDSIZE>) res_23_11 + (bit<WORDSIZE>) res_23_12 + (bit<WORDSIZE>) res_23_13 + (bit<WORDSIZE>) res_23_14 + (bit<WORDSIZE>) res_23_15 + (bit<WORDSIZE>) res_23_16 + (bit<WORDSIZE>) res_23_17 + (bit<WORDSIZE>) res_23_18 + (bit<WORDSIZE>) res_23_19 + (bit<WORDSIZE>) res_23_20 + (bit<WORDSIZE>) res_23_21 + (bit<WORDSIZE>) res_23_22 + (bit<WORDSIZE>) res_23_23 + (bit<WORDSIZE>) res_23_24 + (bit<WORDSIZE>) res_23_25 + (bit<WORDSIZE>) res_23_26 + (bit<WORDSIZE>) res_23_27 + (bit<WORDSIZE>) res_23_28 + (bit<WORDSIZE>) res_23_29 + (bit<WORDSIZE>) res_23_30 + (bit<WORDSIZE>) res_23_31 + (bit<WORDSIZE>) res_23_32;
                // Store data to be fowarded
                reg_neuron_23_data.write(0, meta.neuron_23_data);

                // Neuron 24:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_24_1 = (bit<D_WORDSIZE>) meta.n2n_24_weight_1;
                bit<D_WORDSIZE> operand_a_24_2 = (bit<D_WORDSIZE>) meta.n2n_24_weight_2;
                bit<D_WORDSIZE> operand_a_24_3 = (bit<D_WORDSIZE>) meta.n2n_24_weight_3;
                bit<D_WORDSIZE> operand_a_24_4 = (bit<D_WORDSIZE>) meta.n2n_24_weight_4;
                bit<D_WORDSIZE> operand_a_24_5 = (bit<D_WORDSIZE>) meta.n2n_24_weight_5;
                bit<D_WORDSIZE> operand_a_24_6 = (bit<D_WORDSIZE>) meta.n2n_24_weight_6;
                bit<D_WORDSIZE> operand_a_24_7 = (bit<D_WORDSIZE>) meta.n2n_24_weight_7;
                bit<D_WORDSIZE> operand_a_24_8 = (bit<D_WORDSIZE>) meta.n2n_24_weight_8;
                bit<D_WORDSIZE> operand_a_24_9 = (bit<D_WORDSIZE>) meta.n2n_24_weight_9;
                bit<D_WORDSIZE> operand_a_24_10 = (bit<D_WORDSIZE>) meta.n2n_24_weight_10;
                bit<D_WORDSIZE> operand_a_24_11 = (bit<D_WORDSIZE>) meta.n2n_24_weight_11;
                bit<D_WORDSIZE> operand_a_24_12 = (bit<D_WORDSIZE>) meta.n2n_24_weight_12;
                bit<D_WORDSIZE> operand_a_24_13 = (bit<D_WORDSIZE>) meta.n2n_24_weight_13;
                bit<D_WORDSIZE> operand_a_24_14 = (bit<D_WORDSIZE>) meta.n2n_24_weight_14;
                bit<D_WORDSIZE> operand_a_24_15 = (bit<D_WORDSIZE>) meta.n2n_24_weight_15;
                bit<D_WORDSIZE> operand_a_24_16 = (bit<D_WORDSIZE>) meta.n2n_24_weight_16;
                bit<D_WORDSIZE> operand_a_24_17 = (bit<D_WORDSIZE>) meta.n2n_24_weight_17;
                bit<D_WORDSIZE> operand_a_24_18 = (bit<D_WORDSIZE>) meta.n2n_24_weight_18;
                bit<D_WORDSIZE> operand_a_24_19 = (bit<D_WORDSIZE>) meta.n2n_24_weight_19;
                bit<D_WORDSIZE> operand_a_24_20 = (bit<D_WORDSIZE>) meta.n2n_24_weight_20;
                bit<D_WORDSIZE> operand_a_24_21 = (bit<D_WORDSIZE>) meta.n2n_24_weight_21;
                bit<D_WORDSIZE> operand_a_24_22 = (bit<D_WORDSIZE>) meta.n2n_24_weight_22;
                bit<D_WORDSIZE> operand_a_24_23 = (bit<D_WORDSIZE>) meta.n2n_24_weight_23;
                bit<D_WORDSIZE> operand_a_24_24 = (bit<D_WORDSIZE>) meta.n2n_24_weight_24;
                bit<D_WORDSIZE> operand_a_24_25 = (bit<D_WORDSIZE>) meta.n2n_24_weight_25;
                bit<D_WORDSIZE> operand_a_24_26 = (bit<D_WORDSIZE>) meta.n2n_24_weight_26;
                bit<D_WORDSIZE> operand_a_24_27 = (bit<D_WORDSIZE>) meta.n2n_24_weight_27;
                bit<D_WORDSIZE> operand_a_24_28 = (bit<D_WORDSIZE>) meta.n2n_24_weight_28;
                bit<D_WORDSIZE> operand_a_24_29 = (bit<D_WORDSIZE>) meta.n2n_24_weight_29;
                bit<D_WORDSIZE> operand_a_24_30 = (bit<D_WORDSIZE>) meta.n2n_24_weight_30;
                bit<D_WORDSIZE> operand_a_24_31 = (bit<D_WORDSIZE>) meta.n2n_24_weight_31;
                bit<D_WORDSIZE> operand_a_24_32 = (bit<D_WORDSIZE>) meta.n2n_24_weight_32;
                // Sign extension
                if((operand_a_24_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_1;
                }
                if((operand_a_24_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_2;
                }
                if((operand_a_24_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_3;
                }
                if((operand_a_24_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_4;
                }
                if((operand_a_24_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_5;
                }
                if((operand_a_24_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_6;
                }
                if((operand_a_24_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_7;
                }
                if((operand_a_24_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_8;
                }
                if((operand_a_24_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_9;
                }
                if((operand_a_24_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_10;
                }
                if((operand_a_24_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_11;
                }
                if((operand_a_24_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_12;
                }
                if((operand_a_24_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_13;
                }
                if((operand_a_24_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_14;
                }
                if((operand_a_24_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_15;
                }
                if((operand_a_24_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_16;
                }
                if((operand_a_24_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_17;
                }
                if((operand_a_24_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_18;
                }
                if((operand_a_24_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_19;
                }
                if((operand_a_24_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_20;
                }
                if((operand_a_24_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_21;
                }
                if((operand_a_24_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_22;
                }
                if((operand_a_24_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_23;
                }
                if((operand_a_24_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_24;
                }
                if((operand_a_24_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_25;
                }
                if((operand_a_24_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_26;
                }
                if((operand_a_24_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_27;
                }
                if((operand_a_24_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_28;
                }
                if((operand_a_24_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_29;
                }
                if((operand_a_24_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_30;
                }
                if((operand_a_24_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_31;
                }
                if((operand_a_24_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_24_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_24_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_24_1 = ((operand_a_24_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_24_2 = ((operand_a_24_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_24_3 = ((operand_a_24_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_24_4 = ((operand_a_24_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_24_5 = ((operand_a_24_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_24_6 = ((operand_a_24_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_24_7 = ((operand_a_24_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_24_8 = ((operand_a_24_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_24_9 = ((operand_a_24_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_24_10 = ((operand_a_24_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_24_11 = ((operand_a_24_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_24_12 = ((operand_a_24_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_24_13 = ((operand_a_24_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_24_14 = ((operand_a_24_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_24_15 = ((operand_a_24_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_24_16 = ((operand_a_24_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_24_17 = ((operand_a_24_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_24_18 = ((operand_a_24_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_24_19 = ((operand_a_24_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_24_20 = ((operand_a_24_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_24_21 = ((operand_a_24_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_24_22 = ((operand_a_24_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_24_23 = ((operand_a_24_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_24_24 = ((operand_a_24_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_24_25 = ((operand_a_24_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_24_26 = ((operand_a_24_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_24_27 = ((operand_a_24_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_24_28 = ((operand_a_24_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_24_29 = ((operand_a_24_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_24_30 = ((operand_a_24_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_24_31 = ((operand_a_24_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_24_32 = ((operand_a_24_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_24_data = meta.neuron_24_data + (bit<WORDSIZE>) res_24_1 + (bit<WORDSIZE>) res_24_2 + (bit<WORDSIZE>) res_24_3 + (bit<WORDSIZE>) res_24_4 + (bit<WORDSIZE>) res_24_5 + (bit<WORDSIZE>) res_24_6 + (bit<WORDSIZE>) res_24_7 + (bit<WORDSIZE>) res_24_8 + (bit<WORDSIZE>) res_24_9 + (bit<WORDSIZE>) res_24_10 + (bit<WORDSIZE>) res_24_11 + (bit<WORDSIZE>) res_24_12 + (bit<WORDSIZE>) res_24_13 + (bit<WORDSIZE>) res_24_14 + (bit<WORDSIZE>) res_24_15 + (bit<WORDSIZE>) res_24_16 + (bit<WORDSIZE>) res_24_17 + (bit<WORDSIZE>) res_24_18 + (bit<WORDSIZE>) res_24_19 + (bit<WORDSIZE>) res_24_20 + (bit<WORDSIZE>) res_24_21 + (bit<WORDSIZE>) res_24_22 + (bit<WORDSIZE>) res_24_23 + (bit<WORDSIZE>) res_24_24 + (bit<WORDSIZE>) res_24_25 + (bit<WORDSIZE>) res_24_26 + (bit<WORDSIZE>) res_24_27 + (bit<WORDSIZE>) res_24_28 + (bit<WORDSIZE>) res_24_29 + (bit<WORDSIZE>) res_24_30 + (bit<WORDSIZE>) res_24_31 + (bit<WORDSIZE>) res_24_32;
                // Store data to be fowarded
                reg_neuron_24_data.write(0, meta.neuron_24_data);

                // Neuron 25:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_25_1 = (bit<D_WORDSIZE>) meta.n2n_25_weight_1;
                bit<D_WORDSIZE> operand_a_25_2 = (bit<D_WORDSIZE>) meta.n2n_25_weight_2;
                bit<D_WORDSIZE> operand_a_25_3 = (bit<D_WORDSIZE>) meta.n2n_25_weight_3;
                bit<D_WORDSIZE> operand_a_25_4 = (bit<D_WORDSIZE>) meta.n2n_25_weight_4;
                bit<D_WORDSIZE> operand_a_25_5 = (bit<D_WORDSIZE>) meta.n2n_25_weight_5;
                bit<D_WORDSIZE> operand_a_25_6 = (bit<D_WORDSIZE>) meta.n2n_25_weight_6;
                bit<D_WORDSIZE> operand_a_25_7 = (bit<D_WORDSIZE>) meta.n2n_25_weight_7;
                bit<D_WORDSIZE> operand_a_25_8 = (bit<D_WORDSIZE>) meta.n2n_25_weight_8;
                bit<D_WORDSIZE> operand_a_25_9 = (bit<D_WORDSIZE>) meta.n2n_25_weight_9;
                bit<D_WORDSIZE> operand_a_25_10 = (bit<D_WORDSIZE>) meta.n2n_25_weight_10;
                bit<D_WORDSIZE> operand_a_25_11 = (bit<D_WORDSIZE>) meta.n2n_25_weight_11;
                bit<D_WORDSIZE> operand_a_25_12 = (bit<D_WORDSIZE>) meta.n2n_25_weight_12;
                bit<D_WORDSIZE> operand_a_25_13 = (bit<D_WORDSIZE>) meta.n2n_25_weight_13;
                bit<D_WORDSIZE> operand_a_25_14 = (bit<D_WORDSIZE>) meta.n2n_25_weight_14;
                bit<D_WORDSIZE> operand_a_25_15 = (bit<D_WORDSIZE>) meta.n2n_25_weight_15;
                bit<D_WORDSIZE> operand_a_25_16 = (bit<D_WORDSIZE>) meta.n2n_25_weight_16;
                bit<D_WORDSIZE> operand_a_25_17 = (bit<D_WORDSIZE>) meta.n2n_25_weight_17;
                bit<D_WORDSIZE> operand_a_25_18 = (bit<D_WORDSIZE>) meta.n2n_25_weight_18;
                bit<D_WORDSIZE> operand_a_25_19 = (bit<D_WORDSIZE>) meta.n2n_25_weight_19;
                bit<D_WORDSIZE> operand_a_25_20 = (bit<D_WORDSIZE>) meta.n2n_25_weight_20;
                bit<D_WORDSIZE> operand_a_25_21 = (bit<D_WORDSIZE>) meta.n2n_25_weight_21;
                bit<D_WORDSIZE> operand_a_25_22 = (bit<D_WORDSIZE>) meta.n2n_25_weight_22;
                bit<D_WORDSIZE> operand_a_25_23 = (bit<D_WORDSIZE>) meta.n2n_25_weight_23;
                bit<D_WORDSIZE> operand_a_25_24 = (bit<D_WORDSIZE>) meta.n2n_25_weight_24;
                bit<D_WORDSIZE> operand_a_25_25 = (bit<D_WORDSIZE>) meta.n2n_25_weight_25;
                bit<D_WORDSIZE> operand_a_25_26 = (bit<D_WORDSIZE>) meta.n2n_25_weight_26;
                bit<D_WORDSIZE> operand_a_25_27 = (bit<D_WORDSIZE>) meta.n2n_25_weight_27;
                bit<D_WORDSIZE> operand_a_25_28 = (bit<D_WORDSIZE>) meta.n2n_25_weight_28;
                bit<D_WORDSIZE> operand_a_25_29 = (bit<D_WORDSIZE>) meta.n2n_25_weight_29;
                bit<D_WORDSIZE> operand_a_25_30 = (bit<D_WORDSIZE>) meta.n2n_25_weight_30;
                bit<D_WORDSIZE> operand_a_25_31 = (bit<D_WORDSIZE>) meta.n2n_25_weight_31;
                bit<D_WORDSIZE> operand_a_25_32 = (bit<D_WORDSIZE>) meta.n2n_25_weight_32;
                // Sign extension
                if((operand_a_25_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_1;
                }
                if((operand_a_25_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_2;
                }
                if((operand_a_25_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_3;
                }
                if((operand_a_25_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_4;
                }
                if((operand_a_25_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_5;
                }
                if((operand_a_25_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_6;
                }
                if((operand_a_25_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_7;
                }
                if((operand_a_25_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_8;
                }
                if((operand_a_25_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_9;
                }
                if((operand_a_25_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_10;
                }
                if((operand_a_25_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_11;
                }
                if((operand_a_25_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_12;
                }
                if((operand_a_25_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_13;
                }
                if((operand_a_25_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_14;
                }
                if((operand_a_25_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_15;
                }
                if((operand_a_25_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_16;
                }
                if((operand_a_25_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_17;
                }
                if((operand_a_25_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_18;
                }
                if((operand_a_25_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_19;
                }
                if((operand_a_25_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_20;
                }
                if((operand_a_25_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_21;
                }
                if((operand_a_25_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_22;
                }
                if((operand_a_25_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_23;
                }
                if((operand_a_25_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_24;
                }
                if((operand_a_25_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_25;
                }
                if((operand_a_25_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_26;
                }
                if((operand_a_25_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_27;
                }
                if((operand_a_25_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_28;
                }
                if((operand_a_25_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_29;
                }
                if((operand_a_25_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_30;
                }
                if((operand_a_25_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_31;
                }
                if((operand_a_25_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_25_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_25_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_25_1 = ((operand_a_25_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_25_2 = ((operand_a_25_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_25_3 = ((operand_a_25_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_25_4 = ((operand_a_25_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_25_5 = ((operand_a_25_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_25_6 = ((operand_a_25_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_25_7 = ((operand_a_25_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_25_8 = ((operand_a_25_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_25_9 = ((operand_a_25_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_25_10 = ((operand_a_25_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_25_11 = ((operand_a_25_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_25_12 = ((operand_a_25_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_25_13 = ((operand_a_25_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_25_14 = ((operand_a_25_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_25_15 = ((operand_a_25_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_25_16 = ((operand_a_25_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_25_17 = ((operand_a_25_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_25_18 = ((operand_a_25_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_25_19 = ((operand_a_25_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_25_20 = ((operand_a_25_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_25_21 = ((operand_a_25_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_25_22 = ((operand_a_25_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_25_23 = ((operand_a_25_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_25_24 = ((operand_a_25_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_25_25 = ((operand_a_25_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_25_26 = ((operand_a_25_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_25_27 = ((operand_a_25_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_25_28 = ((operand_a_25_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_25_29 = ((operand_a_25_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_25_30 = ((operand_a_25_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_25_31 = ((operand_a_25_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_25_32 = ((operand_a_25_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_25_data = meta.neuron_25_data + (bit<WORDSIZE>) res_25_1 + (bit<WORDSIZE>) res_25_2 + (bit<WORDSIZE>) res_25_3 + (bit<WORDSIZE>) res_25_4 + (bit<WORDSIZE>) res_25_5 + (bit<WORDSIZE>) res_25_6 + (bit<WORDSIZE>) res_25_7 + (bit<WORDSIZE>) res_25_8 + (bit<WORDSIZE>) res_25_9 + (bit<WORDSIZE>) res_25_10 + (bit<WORDSIZE>) res_25_11 + (bit<WORDSIZE>) res_25_12 + (bit<WORDSIZE>) res_25_13 + (bit<WORDSIZE>) res_25_14 + (bit<WORDSIZE>) res_25_15 + (bit<WORDSIZE>) res_25_16 + (bit<WORDSIZE>) res_25_17 + (bit<WORDSIZE>) res_25_18 + (bit<WORDSIZE>) res_25_19 + (bit<WORDSIZE>) res_25_20 + (bit<WORDSIZE>) res_25_21 + (bit<WORDSIZE>) res_25_22 + (bit<WORDSIZE>) res_25_23 + (bit<WORDSIZE>) res_25_24 + (bit<WORDSIZE>) res_25_25 + (bit<WORDSIZE>) res_25_26 + (bit<WORDSIZE>) res_25_27 + (bit<WORDSIZE>) res_25_28 + (bit<WORDSIZE>) res_25_29 + (bit<WORDSIZE>) res_25_30 + (bit<WORDSIZE>) res_25_31 + (bit<WORDSIZE>) res_25_32;
                // Store data to be fowarded
                reg_neuron_25_data.write(0, meta.neuron_25_data);

                // Neuron 26:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_26_1 = (bit<D_WORDSIZE>) meta.n2n_26_weight_1;
                bit<D_WORDSIZE> operand_a_26_2 = (bit<D_WORDSIZE>) meta.n2n_26_weight_2;
                bit<D_WORDSIZE> operand_a_26_3 = (bit<D_WORDSIZE>) meta.n2n_26_weight_3;
                bit<D_WORDSIZE> operand_a_26_4 = (bit<D_WORDSIZE>) meta.n2n_26_weight_4;
                bit<D_WORDSIZE> operand_a_26_5 = (bit<D_WORDSIZE>) meta.n2n_26_weight_5;
                bit<D_WORDSIZE> operand_a_26_6 = (bit<D_WORDSIZE>) meta.n2n_26_weight_6;
                bit<D_WORDSIZE> operand_a_26_7 = (bit<D_WORDSIZE>) meta.n2n_26_weight_7;
                bit<D_WORDSIZE> operand_a_26_8 = (bit<D_WORDSIZE>) meta.n2n_26_weight_8;
                bit<D_WORDSIZE> operand_a_26_9 = (bit<D_WORDSIZE>) meta.n2n_26_weight_9;
                bit<D_WORDSIZE> operand_a_26_10 = (bit<D_WORDSIZE>) meta.n2n_26_weight_10;
                bit<D_WORDSIZE> operand_a_26_11 = (bit<D_WORDSIZE>) meta.n2n_26_weight_11;
                bit<D_WORDSIZE> operand_a_26_12 = (bit<D_WORDSIZE>) meta.n2n_26_weight_12;
                bit<D_WORDSIZE> operand_a_26_13 = (bit<D_WORDSIZE>) meta.n2n_26_weight_13;
                bit<D_WORDSIZE> operand_a_26_14 = (bit<D_WORDSIZE>) meta.n2n_26_weight_14;
                bit<D_WORDSIZE> operand_a_26_15 = (bit<D_WORDSIZE>) meta.n2n_26_weight_15;
                bit<D_WORDSIZE> operand_a_26_16 = (bit<D_WORDSIZE>) meta.n2n_26_weight_16;
                bit<D_WORDSIZE> operand_a_26_17 = (bit<D_WORDSIZE>) meta.n2n_26_weight_17;
                bit<D_WORDSIZE> operand_a_26_18 = (bit<D_WORDSIZE>) meta.n2n_26_weight_18;
                bit<D_WORDSIZE> operand_a_26_19 = (bit<D_WORDSIZE>) meta.n2n_26_weight_19;
                bit<D_WORDSIZE> operand_a_26_20 = (bit<D_WORDSIZE>) meta.n2n_26_weight_20;
                bit<D_WORDSIZE> operand_a_26_21 = (bit<D_WORDSIZE>) meta.n2n_26_weight_21;
                bit<D_WORDSIZE> operand_a_26_22 = (bit<D_WORDSIZE>) meta.n2n_26_weight_22;
                bit<D_WORDSIZE> operand_a_26_23 = (bit<D_WORDSIZE>) meta.n2n_26_weight_23;
                bit<D_WORDSIZE> operand_a_26_24 = (bit<D_WORDSIZE>) meta.n2n_26_weight_24;
                bit<D_WORDSIZE> operand_a_26_25 = (bit<D_WORDSIZE>) meta.n2n_26_weight_25;
                bit<D_WORDSIZE> operand_a_26_26 = (bit<D_WORDSIZE>) meta.n2n_26_weight_26;
                bit<D_WORDSIZE> operand_a_26_27 = (bit<D_WORDSIZE>) meta.n2n_26_weight_27;
                bit<D_WORDSIZE> operand_a_26_28 = (bit<D_WORDSIZE>) meta.n2n_26_weight_28;
                bit<D_WORDSIZE> operand_a_26_29 = (bit<D_WORDSIZE>) meta.n2n_26_weight_29;
                bit<D_WORDSIZE> operand_a_26_30 = (bit<D_WORDSIZE>) meta.n2n_26_weight_30;
                bit<D_WORDSIZE> operand_a_26_31 = (bit<D_WORDSIZE>) meta.n2n_26_weight_31;
                bit<D_WORDSIZE> operand_a_26_32 = (bit<D_WORDSIZE>) meta.n2n_26_weight_32;
                // Sign extension
                if((operand_a_26_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_1;
                }
                if((operand_a_26_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_2;
                }
                if((operand_a_26_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_3;
                }
                if((operand_a_26_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_4;
                }
                if((operand_a_26_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_5;
                }
                if((operand_a_26_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_6;
                }
                if((operand_a_26_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_7;
                }
                if((operand_a_26_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_8;
                }
                if((operand_a_26_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_9;
                }
                if((operand_a_26_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_10;
                }
                if((operand_a_26_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_11;
                }
                if((operand_a_26_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_12;
                }
                if((operand_a_26_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_13;
                }
                if((operand_a_26_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_14;
                }
                if((operand_a_26_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_15;
                }
                if((operand_a_26_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_16;
                }
                if((operand_a_26_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_17;
                }
                if((operand_a_26_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_18;
                }
                if((operand_a_26_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_19;
                }
                if((operand_a_26_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_20;
                }
                if((operand_a_26_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_21;
                }
                if((operand_a_26_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_22;
                }
                if((operand_a_26_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_23;
                }
                if((operand_a_26_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_24;
                }
                if((operand_a_26_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_25;
                }
                if((operand_a_26_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_26;
                }
                if((operand_a_26_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_27;
                }
                if((operand_a_26_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_28;
                }
                if((operand_a_26_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_29;
                }
                if((operand_a_26_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_30;
                }
                if((operand_a_26_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_31;
                }
                if((operand_a_26_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_26_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_26_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_26_1 = ((operand_a_26_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_26_2 = ((operand_a_26_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_26_3 = ((operand_a_26_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_26_4 = ((operand_a_26_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_26_5 = ((operand_a_26_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_26_6 = ((operand_a_26_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_26_7 = ((operand_a_26_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_26_8 = ((operand_a_26_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_26_9 = ((operand_a_26_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_26_10 = ((operand_a_26_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_26_11 = ((operand_a_26_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_26_12 = ((operand_a_26_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_26_13 = ((operand_a_26_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_26_14 = ((operand_a_26_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_26_15 = ((operand_a_26_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_26_16 = ((operand_a_26_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_26_17 = ((operand_a_26_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_26_18 = ((operand_a_26_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_26_19 = ((operand_a_26_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_26_20 = ((operand_a_26_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_26_21 = ((operand_a_26_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_26_22 = ((operand_a_26_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_26_23 = ((operand_a_26_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_26_24 = ((operand_a_26_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_26_25 = ((operand_a_26_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_26_26 = ((operand_a_26_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_26_27 = ((operand_a_26_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_26_28 = ((operand_a_26_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_26_29 = ((operand_a_26_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_26_30 = ((operand_a_26_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_26_31 = ((operand_a_26_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_26_32 = ((operand_a_26_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_26_data = meta.neuron_26_data + (bit<WORDSIZE>) res_26_1 + (bit<WORDSIZE>) res_26_2 + (bit<WORDSIZE>) res_26_3 + (bit<WORDSIZE>) res_26_4 + (bit<WORDSIZE>) res_26_5 + (bit<WORDSIZE>) res_26_6 + (bit<WORDSIZE>) res_26_7 + (bit<WORDSIZE>) res_26_8 + (bit<WORDSIZE>) res_26_9 + (bit<WORDSIZE>) res_26_10 + (bit<WORDSIZE>) res_26_11 + (bit<WORDSIZE>) res_26_12 + (bit<WORDSIZE>) res_26_13 + (bit<WORDSIZE>) res_26_14 + (bit<WORDSIZE>) res_26_15 + (bit<WORDSIZE>) res_26_16 + (bit<WORDSIZE>) res_26_17 + (bit<WORDSIZE>) res_26_18 + (bit<WORDSIZE>) res_26_19 + (bit<WORDSIZE>) res_26_20 + (bit<WORDSIZE>) res_26_21 + (bit<WORDSIZE>) res_26_22 + (bit<WORDSIZE>) res_26_23 + (bit<WORDSIZE>) res_26_24 + (bit<WORDSIZE>) res_26_25 + (bit<WORDSIZE>) res_26_26 + (bit<WORDSIZE>) res_26_27 + (bit<WORDSIZE>) res_26_28 + (bit<WORDSIZE>) res_26_29 + (bit<WORDSIZE>) res_26_30 + (bit<WORDSIZE>) res_26_31 + (bit<WORDSIZE>) res_26_32;
                // Store data to be fowarded
                reg_neuron_26_data.write(0, meta.neuron_26_data);

                // Neuron 27:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_27_1 = (bit<D_WORDSIZE>) meta.n2n_27_weight_1;
                bit<D_WORDSIZE> operand_a_27_2 = (bit<D_WORDSIZE>) meta.n2n_27_weight_2;
                bit<D_WORDSIZE> operand_a_27_3 = (bit<D_WORDSIZE>) meta.n2n_27_weight_3;
                bit<D_WORDSIZE> operand_a_27_4 = (bit<D_WORDSIZE>) meta.n2n_27_weight_4;
                bit<D_WORDSIZE> operand_a_27_5 = (bit<D_WORDSIZE>) meta.n2n_27_weight_5;
                bit<D_WORDSIZE> operand_a_27_6 = (bit<D_WORDSIZE>) meta.n2n_27_weight_6;
                bit<D_WORDSIZE> operand_a_27_7 = (bit<D_WORDSIZE>) meta.n2n_27_weight_7;
                bit<D_WORDSIZE> operand_a_27_8 = (bit<D_WORDSIZE>) meta.n2n_27_weight_8;
                bit<D_WORDSIZE> operand_a_27_9 = (bit<D_WORDSIZE>) meta.n2n_27_weight_9;
                bit<D_WORDSIZE> operand_a_27_10 = (bit<D_WORDSIZE>) meta.n2n_27_weight_10;
                bit<D_WORDSIZE> operand_a_27_11 = (bit<D_WORDSIZE>) meta.n2n_27_weight_11;
                bit<D_WORDSIZE> operand_a_27_12 = (bit<D_WORDSIZE>) meta.n2n_27_weight_12;
                bit<D_WORDSIZE> operand_a_27_13 = (bit<D_WORDSIZE>) meta.n2n_27_weight_13;
                bit<D_WORDSIZE> operand_a_27_14 = (bit<D_WORDSIZE>) meta.n2n_27_weight_14;
                bit<D_WORDSIZE> operand_a_27_15 = (bit<D_WORDSIZE>) meta.n2n_27_weight_15;
                bit<D_WORDSIZE> operand_a_27_16 = (bit<D_WORDSIZE>) meta.n2n_27_weight_16;
                bit<D_WORDSIZE> operand_a_27_17 = (bit<D_WORDSIZE>) meta.n2n_27_weight_17;
                bit<D_WORDSIZE> operand_a_27_18 = (bit<D_WORDSIZE>) meta.n2n_27_weight_18;
                bit<D_WORDSIZE> operand_a_27_19 = (bit<D_WORDSIZE>) meta.n2n_27_weight_19;
                bit<D_WORDSIZE> operand_a_27_20 = (bit<D_WORDSIZE>) meta.n2n_27_weight_20;
                bit<D_WORDSIZE> operand_a_27_21 = (bit<D_WORDSIZE>) meta.n2n_27_weight_21;
                bit<D_WORDSIZE> operand_a_27_22 = (bit<D_WORDSIZE>) meta.n2n_27_weight_22;
                bit<D_WORDSIZE> operand_a_27_23 = (bit<D_WORDSIZE>) meta.n2n_27_weight_23;
                bit<D_WORDSIZE> operand_a_27_24 = (bit<D_WORDSIZE>) meta.n2n_27_weight_24;
                bit<D_WORDSIZE> operand_a_27_25 = (bit<D_WORDSIZE>) meta.n2n_27_weight_25;
                bit<D_WORDSIZE> operand_a_27_26 = (bit<D_WORDSIZE>) meta.n2n_27_weight_26;
                bit<D_WORDSIZE> operand_a_27_27 = (bit<D_WORDSIZE>) meta.n2n_27_weight_27;
                bit<D_WORDSIZE> operand_a_27_28 = (bit<D_WORDSIZE>) meta.n2n_27_weight_28;
                bit<D_WORDSIZE> operand_a_27_29 = (bit<D_WORDSIZE>) meta.n2n_27_weight_29;
                bit<D_WORDSIZE> operand_a_27_30 = (bit<D_WORDSIZE>) meta.n2n_27_weight_30;
                bit<D_WORDSIZE> operand_a_27_31 = (bit<D_WORDSIZE>) meta.n2n_27_weight_31;
                bit<D_WORDSIZE> operand_a_27_32 = (bit<D_WORDSIZE>) meta.n2n_27_weight_32;
                // Sign extension
                if((operand_a_27_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_1;
                }
                if((operand_a_27_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_2;
                }
                if((operand_a_27_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_3;
                }
                if((operand_a_27_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_4;
                }
                if((operand_a_27_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_5;
                }
                if((operand_a_27_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_6;
                }
                if((operand_a_27_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_7;
                }
                if((operand_a_27_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_8;
                }
                if((operand_a_27_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_9;
                }
                if((operand_a_27_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_10;
                }
                if((operand_a_27_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_11;
                }
                if((operand_a_27_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_12;
                }
                if((operand_a_27_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_13;
                }
                if((operand_a_27_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_14;
                }
                if((operand_a_27_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_15;
                }
                if((operand_a_27_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_16;
                }
                if((operand_a_27_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_17;
                }
                if((operand_a_27_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_18;
                }
                if((operand_a_27_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_19;
                }
                if((operand_a_27_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_20;
                }
                if((operand_a_27_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_21;
                }
                if((operand_a_27_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_22;
                }
                if((operand_a_27_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_23;
                }
                if((operand_a_27_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_24;
                }
                if((operand_a_27_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_25;
                }
                if((operand_a_27_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_26;
                }
                if((operand_a_27_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_27;
                }
                if((operand_a_27_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_28;
                }
                if((operand_a_27_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_29;
                }
                if((operand_a_27_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_30;
                }
                if((operand_a_27_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_31;
                }
                if((operand_a_27_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_27_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_27_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_27_1 = ((operand_a_27_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_27_2 = ((operand_a_27_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_27_3 = ((operand_a_27_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_27_4 = ((operand_a_27_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_27_5 = ((operand_a_27_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_27_6 = ((operand_a_27_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_27_7 = ((operand_a_27_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_27_8 = ((operand_a_27_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_27_9 = ((operand_a_27_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_27_10 = ((operand_a_27_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_27_11 = ((operand_a_27_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_27_12 = ((operand_a_27_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_27_13 = ((operand_a_27_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_27_14 = ((operand_a_27_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_27_15 = ((operand_a_27_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_27_16 = ((operand_a_27_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_27_17 = ((operand_a_27_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_27_18 = ((operand_a_27_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_27_19 = ((operand_a_27_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_27_20 = ((operand_a_27_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_27_21 = ((operand_a_27_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_27_22 = ((operand_a_27_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_27_23 = ((operand_a_27_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_27_24 = ((operand_a_27_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_27_25 = ((operand_a_27_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_27_26 = ((operand_a_27_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_27_27 = ((operand_a_27_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_27_28 = ((operand_a_27_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_27_29 = ((operand_a_27_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_27_30 = ((operand_a_27_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_27_31 = ((operand_a_27_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_27_32 = ((operand_a_27_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_27_data = meta.neuron_27_data + (bit<WORDSIZE>) res_27_1 + (bit<WORDSIZE>) res_27_2 + (bit<WORDSIZE>) res_27_3 + (bit<WORDSIZE>) res_27_4 + (bit<WORDSIZE>) res_27_5 + (bit<WORDSIZE>) res_27_6 + (bit<WORDSIZE>) res_27_7 + (bit<WORDSIZE>) res_27_8 + (bit<WORDSIZE>) res_27_9 + (bit<WORDSIZE>) res_27_10 + (bit<WORDSIZE>) res_27_11 + (bit<WORDSIZE>) res_27_12 + (bit<WORDSIZE>) res_27_13 + (bit<WORDSIZE>) res_27_14 + (bit<WORDSIZE>) res_27_15 + (bit<WORDSIZE>) res_27_16 + (bit<WORDSIZE>) res_27_17 + (bit<WORDSIZE>) res_27_18 + (bit<WORDSIZE>) res_27_19 + (bit<WORDSIZE>) res_27_20 + (bit<WORDSIZE>) res_27_21 + (bit<WORDSIZE>) res_27_22 + (bit<WORDSIZE>) res_27_23 + (bit<WORDSIZE>) res_27_24 + (bit<WORDSIZE>) res_27_25 + (bit<WORDSIZE>) res_27_26 + (bit<WORDSIZE>) res_27_27 + (bit<WORDSIZE>) res_27_28 + (bit<WORDSIZE>) res_27_29 + (bit<WORDSIZE>) res_27_30 + (bit<WORDSIZE>) res_27_31 + (bit<WORDSIZE>) res_27_32;
                // Store data to be fowarded
                reg_neuron_27_data.write(0, meta.neuron_27_data);

                // Neuron 28:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_28_1 = (bit<D_WORDSIZE>) meta.n2n_28_weight_1;
                bit<D_WORDSIZE> operand_a_28_2 = (bit<D_WORDSIZE>) meta.n2n_28_weight_2;
                bit<D_WORDSIZE> operand_a_28_3 = (bit<D_WORDSIZE>) meta.n2n_28_weight_3;
                bit<D_WORDSIZE> operand_a_28_4 = (bit<D_WORDSIZE>) meta.n2n_28_weight_4;
                bit<D_WORDSIZE> operand_a_28_5 = (bit<D_WORDSIZE>) meta.n2n_28_weight_5;
                bit<D_WORDSIZE> operand_a_28_6 = (bit<D_WORDSIZE>) meta.n2n_28_weight_6;
                bit<D_WORDSIZE> operand_a_28_7 = (bit<D_WORDSIZE>) meta.n2n_28_weight_7;
                bit<D_WORDSIZE> operand_a_28_8 = (bit<D_WORDSIZE>) meta.n2n_28_weight_8;
                bit<D_WORDSIZE> operand_a_28_9 = (bit<D_WORDSIZE>) meta.n2n_28_weight_9;
                bit<D_WORDSIZE> operand_a_28_10 = (bit<D_WORDSIZE>) meta.n2n_28_weight_10;
                bit<D_WORDSIZE> operand_a_28_11 = (bit<D_WORDSIZE>) meta.n2n_28_weight_11;
                bit<D_WORDSIZE> operand_a_28_12 = (bit<D_WORDSIZE>) meta.n2n_28_weight_12;
                bit<D_WORDSIZE> operand_a_28_13 = (bit<D_WORDSIZE>) meta.n2n_28_weight_13;
                bit<D_WORDSIZE> operand_a_28_14 = (bit<D_WORDSIZE>) meta.n2n_28_weight_14;
                bit<D_WORDSIZE> operand_a_28_15 = (bit<D_WORDSIZE>) meta.n2n_28_weight_15;
                bit<D_WORDSIZE> operand_a_28_16 = (bit<D_WORDSIZE>) meta.n2n_28_weight_16;
                bit<D_WORDSIZE> operand_a_28_17 = (bit<D_WORDSIZE>) meta.n2n_28_weight_17;
                bit<D_WORDSIZE> operand_a_28_18 = (bit<D_WORDSIZE>) meta.n2n_28_weight_18;
                bit<D_WORDSIZE> operand_a_28_19 = (bit<D_WORDSIZE>) meta.n2n_28_weight_19;
                bit<D_WORDSIZE> operand_a_28_20 = (bit<D_WORDSIZE>) meta.n2n_28_weight_20;
                bit<D_WORDSIZE> operand_a_28_21 = (bit<D_WORDSIZE>) meta.n2n_28_weight_21;
                bit<D_WORDSIZE> operand_a_28_22 = (bit<D_WORDSIZE>) meta.n2n_28_weight_22;
                bit<D_WORDSIZE> operand_a_28_23 = (bit<D_WORDSIZE>) meta.n2n_28_weight_23;
                bit<D_WORDSIZE> operand_a_28_24 = (bit<D_WORDSIZE>) meta.n2n_28_weight_24;
                bit<D_WORDSIZE> operand_a_28_25 = (bit<D_WORDSIZE>) meta.n2n_28_weight_25;
                bit<D_WORDSIZE> operand_a_28_26 = (bit<D_WORDSIZE>) meta.n2n_28_weight_26;
                bit<D_WORDSIZE> operand_a_28_27 = (bit<D_WORDSIZE>) meta.n2n_28_weight_27;
                bit<D_WORDSIZE> operand_a_28_28 = (bit<D_WORDSIZE>) meta.n2n_28_weight_28;
                bit<D_WORDSIZE> operand_a_28_29 = (bit<D_WORDSIZE>) meta.n2n_28_weight_29;
                bit<D_WORDSIZE> operand_a_28_30 = (bit<D_WORDSIZE>) meta.n2n_28_weight_30;
                bit<D_WORDSIZE> operand_a_28_31 = (bit<D_WORDSIZE>) meta.n2n_28_weight_31;
                bit<D_WORDSIZE> operand_a_28_32 = (bit<D_WORDSIZE>) meta.n2n_28_weight_32;
                // Sign extension
                if((operand_a_28_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_1;
                }
                if((operand_a_28_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_2;
                }
                if((operand_a_28_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_3;
                }
                if((operand_a_28_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_4;
                }
                if((operand_a_28_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_5;
                }
                if((operand_a_28_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_6;
                }
                if((operand_a_28_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_7;
                }
                if((operand_a_28_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_8;
                }
                if((operand_a_28_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_9;
                }
                if((operand_a_28_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_10;
                }
                if((operand_a_28_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_11;
                }
                if((operand_a_28_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_12;
                }
                if((operand_a_28_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_13;
                }
                if((operand_a_28_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_14;
                }
                if((operand_a_28_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_15;
                }
                if((operand_a_28_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_16;
                }
                if((operand_a_28_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_17;
                }
                if((operand_a_28_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_18;
                }
                if((operand_a_28_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_19;
                }
                if((operand_a_28_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_20;
                }
                if((operand_a_28_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_21;
                }
                if((operand_a_28_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_22;
                }
                if((operand_a_28_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_23;
                }
                if((operand_a_28_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_24;
                }
                if((operand_a_28_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_25;
                }
                if((operand_a_28_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_26;
                }
                if((operand_a_28_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_27;
                }
                if((operand_a_28_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_28;
                }
                if((operand_a_28_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_29;
                }
                if((operand_a_28_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_30;
                }
                if((operand_a_28_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_31;
                }
                if((operand_a_28_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_28_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_28_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_28_1 = ((operand_a_28_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_28_2 = ((operand_a_28_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_28_3 = ((operand_a_28_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_28_4 = ((operand_a_28_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_28_5 = ((operand_a_28_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_28_6 = ((operand_a_28_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_28_7 = ((operand_a_28_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_28_8 = ((operand_a_28_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_28_9 = ((operand_a_28_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_28_10 = ((operand_a_28_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_28_11 = ((operand_a_28_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_28_12 = ((operand_a_28_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_28_13 = ((operand_a_28_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_28_14 = ((operand_a_28_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_28_15 = ((operand_a_28_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_28_16 = ((operand_a_28_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_28_17 = ((operand_a_28_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_28_18 = ((operand_a_28_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_28_19 = ((operand_a_28_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_28_20 = ((operand_a_28_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_28_21 = ((operand_a_28_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_28_22 = ((operand_a_28_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_28_23 = ((operand_a_28_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_28_24 = ((operand_a_28_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_28_25 = ((operand_a_28_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_28_26 = ((operand_a_28_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_28_27 = ((operand_a_28_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_28_28 = ((operand_a_28_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_28_29 = ((operand_a_28_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_28_30 = ((operand_a_28_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_28_31 = ((operand_a_28_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_28_32 = ((operand_a_28_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_28_data = meta.neuron_28_data + (bit<WORDSIZE>) res_28_1 + (bit<WORDSIZE>) res_28_2 + (bit<WORDSIZE>) res_28_3 + (bit<WORDSIZE>) res_28_4 + (bit<WORDSIZE>) res_28_5 + (bit<WORDSIZE>) res_28_6 + (bit<WORDSIZE>) res_28_7 + (bit<WORDSIZE>) res_28_8 + (bit<WORDSIZE>) res_28_9 + (bit<WORDSIZE>) res_28_10 + (bit<WORDSIZE>) res_28_11 + (bit<WORDSIZE>) res_28_12 + (bit<WORDSIZE>) res_28_13 + (bit<WORDSIZE>) res_28_14 + (bit<WORDSIZE>) res_28_15 + (bit<WORDSIZE>) res_28_16 + (bit<WORDSIZE>) res_28_17 + (bit<WORDSIZE>) res_28_18 + (bit<WORDSIZE>) res_28_19 + (bit<WORDSIZE>) res_28_20 + (bit<WORDSIZE>) res_28_21 + (bit<WORDSIZE>) res_28_22 + (bit<WORDSIZE>) res_28_23 + (bit<WORDSIZE>) res_28_24 + (bit<WORDSIZE>) res_28_25 + (bit<WORDSIZE>) res_28_26 + (bit<WORDSIZE>) res_28_27 + (bit<WORDSIZE>) res_28_28 + (bit<WORDSIZE>) res_28_29 + (bit<WORDSIZE>) res_28_30 + (bit<WORDSIZE>) res_28_31 + (bit<WORDSIZE>) res_28_32;
                // Store data to be fowarded
                reg_neuron_28_data.write(0, meta.neuron_28_data);

                // Neuron 29:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_29_1 = (bit<D_WORDSIZE>) meta.n2n_29_weight_1;
                bit<D_WORDSIZE> operand_a_29_2 = (bit<D_WORDSIZE>) meta.n2n_29_weight_2;
                bit<D_WORDSIZE> operand_a_29_3 = (bit<D_WORDSIZE>) meta.n2n_29_weight_3;
                bit<D_WORDSIZE> operand_a_29_4 = (bit<D_WORDSIZE>) meta.n2n_29_weight_4;
                bit<D_WORDSIZE> operand_a_29_5 = (bit<D_WORDSIZE>) meta.n2n_29_weight_5;
                bit<D_WORDSIZE> operand_a_29_6 = (bit<D_WORDSIZE>) meta.n2n_29_weight_6;
                bit<D_WORDSIZE> operand_a_29_7 = (bit<D_WORDSIZE>) meta.n2n_29_weight_7;
                bit<D_WORDSIZE> operand_a_29_8 = (bit<D_WORDSIZE>) meta.n2n_29_weight_8;
                bit<D_WORDSIZE> operand_a_29_9 = (bit<D_WORDSIZE>) meta.n2n_29_weight_9;
                bit<D_WORDSIZE> operand_a_29_10 = (bit<D_WORDSIZE>) meta.n2n_29_weight_10;
                bit<D_WORDSIZE> operand_a_29_11 = (bit<D_WORDSIZE>) meta.n2n_29_weight_11;
                bit<D_WORDSIZE> operand_a_29_12 = (bit<D_WORDSIZE>) meta.n2n_29_weight_12;
                bit<D_WORDSIZE> operand_a_29_13 = (bit<D_WORDSIZE>) meta.n2n_29_weight_13;
                bit<D_WORDSIZE> operand_a_29_14 = (bit<D_WORDSIZE>) meta.n2n_29_weight_14;
                bit<D_WORDSIZE> operand_a_29_15 = (bit<D_WORDSIZE>) meta.n2n_29_weight_15;
                bit<D_WORDSIZE> operand_a_29_16 = (bit<D_WORDSIZE>) meta.n2n_29_weight_16;
                bit<D_WORDSIZE> operand_a_29_17 = (bit<D_WORDSIZE>) meta.n2n_29_weight_17;
                bit<D_WORDSIZE> operand_a_29_18 = (bit<D_WORDSIZE>) meta.n2n_29_weight_18;
                bit<D_WORDSIZE> operand_a_29_19 = (bit<D_WORDSIZE>) meta.n2n_29_weight_19;
                bit<D_WORDSIZE> operand_a_29_20 = (bit<D_WORDSIZE>) meta.n2n_29_weight_20;
                bit<D_WORDSIZE> operand_a_29_21 = (bit<D_WORDSIZE>) meta.n2n_29_weight_21;
                bit<D_WORDSIZE> operand_a_29_22 = (bit<D_WORDSIZE>) meta.n2n_29_weight_22;
                bit<D_WORDSIZE> operand_a_29_23 = (bit<D_WORDSIZE>) meta.n2n_29_weight_23;
                bit<D_WORDSIZE> operand_a_29_24 = (bit<D_WORDSIZE>) meta.n2n_29_weight_24;
                bit<D_WORDSIZE> operand_a_29_25 = (bit<D_WORDSIZE>) meta.n2n_29_weight_25;
                bit<D_WORDSIZE> operand_a_29_26 = (bit<D_WORDSIZE>) meta.n2n_29_weight_26;
                bit<D_WORDSIZE> operand_a_29_27 = (bit<D_WORDSIZE>) meta.n2n_29_weight_27;
                bit<D_WORDSIZE> operand_a_29_28 = (bit<D_WORDSIZE>) meta.n2n_29_weight_28;
                bit<D_WORDSIZE> operand_a_29_29 = (bit<D_WORDSIZE>) meta.n2n_29_weight_29;
                bit<D_WORDSIZE> operand_a_29_30 = (bit<D_WORDSIZE>) meta.n2n_29_weight_30;
                bit<D_WORDSIZE> operand_a_29_31 = (bit<D_WORDSIZE>) meta.n2n_29_weight_31;
                bit<D_WORDSIZE> operand_a_29_32 = (bit<D_WORDSIZE>) meta.n2n_29_weight_32;
                // Sign extension
                if((operand_a_29_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_1;
                }
                if((operand_a_29_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_2;
                }
                if((operand_a_29_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_3;
                }
                if((operand_a_29_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_4;
                }
                if((operand_a_29_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_5;
                }
                if((operand_a_29_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_6;
                }
                if((operand_a_29_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_7;
                }
                if((operand_a_29_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_8;
                }
                if((operand_a_29_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_9;
                }
                if((operand_a_29_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_10;
                }
                if((operand_a_29_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_11;
                }
                if((operand_a_29_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_12;
                }
                if((operand_a_29_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_13;
                }
                if((operand_a_29_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_14;
                }
                if((operand_a_29_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_15;
                }
                if((operand_a_29_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_16;
                }
                if((operand_a_29_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_17;
                }
                if((operand_a_29_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_18;
                }
                if((operand_a_29_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_19;
                }
                if((operand_a_29_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_20;
                }
                if((operand_a_29_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_21;
                }
                if((operand_a_29_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_22;
                }
                if((operand_a_29_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_23;
                }
                if((operand_a_29_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_24;
                }
                if((operand_a_29_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_25;
                }
                if((operand_a_29_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_26;
                }
                if((operand_a_29_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_27;
                }
                if((operand_a_29_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_28;
                }
                if((operand_a_29_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_29;
                }
                if((operand_a_29_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_30;
                }
                if((operand_a_29_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_31;
                }
                if((operand_a_29_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_29_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_29_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_29_1 = ((operand_a_29_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_29_2 = ((operand_a_29_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_29_3 = ((operand_a_29_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_29_4 = ((operand_a_29_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_29_5 = ((operand_a_29_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_29_6 = ((operand_a_29_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_29_7 = ((operand_a_29_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_29_8 = ((operand_a_29_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_29_9 = ((operand_a_29_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_29_10 = ((operand_a_29_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_29_11 = ((operand_a_29_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_29_12 = ((operand_a_29_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_29_13 = ((operand_a_29_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_29_14 = ((operand_a_29_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_29_15 = ((operand_a_29_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_29_16 = ((operand_a_29_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_29_17 = ((operand_a_29_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_29_18 = ((operand_a_29_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_29_19 = ((operand_a_29_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_29_20 = ((operand_a_29_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_29_21 = ((operand_a_29_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_29_22 = ((operand_a_29_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_29_23 = ((operand_a_29_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_29_24 = ((operand_a_29_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_29_25 = ((operand_a_29_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_29_26 = ((operand_a_29_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_29_27 = ((operand_a_29_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_29_28 = ((operand_a_29_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_29_29 = ((operand_a_29_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_29_30 = ((operand_a_29_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_29_31 = ((operand_a_29_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_29_32 = ((operand_a_29_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_29_data = meta.neuron_29_data + (bit<WORDSIZE>) res_29_1 + (bit<WORDSIZE>) res_29_2 + (bit<WORDSIZE>) res_29_3 + (bit<WORDSIZE>) res_29_4 + (bit<WORDSIZE>) res_29_5 + (bit<WORDSIZE>) res_29_6 + (bit<WORDSIZE>) res_29_7 + (bit<WORDSIZE>) res_29_8 + (bit<WORDSIZE>) res_29_9 + (bit<WORDSIZE>) res_29_10 + (bit<WORDSIZE>) res_29_11 + (bit<WORDSIZE>) res_29_12 + (bit<WORDSIZE>) res_29_13 + (bit<WORDSIZE>) res_29_14 + (bit<WORDSIZE>) res_29_15 + (bit<WORDSIZE>) res_29_16 + (bit<WORDSIZE>) res_29_17 + (bit<WORDSIZE>) res_29_18 + (bit<WORDSIZE>) res_29_19 + (bit<WORDSIZE>) res_29_20 + (bit<WORDSIZE>) res_29_21 + (bit<WORDSIZE>) res_29_22 + (bit<WORDSIZE>) res_29_23 + (bit<WORDSIZE>) res_29_24 + (bit<WORDSIZE>) res_29_25 + (bit<WORDSIZE>) res_29_26 + (bit<WORDSIZE>) res_29_27 + (bit<WORDSIZE>) res_29_28 + (bit<WORDSIZE>) res_29_29 + (bit<WORDSIZE>) res_29_30 + (bit<WORDSIZE>) res_29_31 + (bit<WORDSIZE>) res_29_32;
                // Store data to be fowarded
                reg_neuron_29_data.write(0, meta.neuron_29_data);

                // Neuron 30:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_30_1 = (bit<D_WORDSIZE>) meta.n2n_30_weight_1;
                bit<D_WORDSIZE> operand_a_30_2 = (bit<D_WORDSIZE>) meta.n2n_30_weight_2;
                bit<D_WORDSIZE> operand_a_30_3 = (bit<D_WORDSIZE>) meta.n2n_30_weight_3;
                bit<D_WORDSIZE> operand_a_30_4 = (bit<D_WORDSIZE>) meta.n2n_30_weight_4;
                bit<D_WORDSIZE> operand_a_30_5 = (bit<D_WORDSIZE>) meta.n2n_30_weight_5;
                bit<D_WORDSIZE> operand_a_30_6 = (bit<D_WORDSIZE>) meta.n2n_30_weight_6;
                bit<D_WORDSIZE> operand_a_30_7 = (bit<D_WORDSIZE>) meta.n2n_30_weight_7;
                bit<D_WORDSIZE> operand_a_30_8 = (bit<D_WORDSIZE>) meta.n2n_30_weight_8;
                bit<D_WORDSIZE> operand_a_30_9 = (bit<D_WORDSIZE>) meta.n2n_30_weight_9;
                bit<D_WORDSIZE> operand_a_30_10 = (bit<D_WORDSIZE>) meta.n2n_30_weight_10;
                bit<D_WORDSIZE> operand_a_30_11 = (bit<D_WORDSIZE>) meta.n2n_30_weight_11;
                bit<D_WORDSIZE> operand_a_30_12 = (bit<D_WORDSIZE>) meta.n2n_30_weight_12;
                bit<D_WORDSIZE> operand_a_30_13 = (bit<D_WORDSIZE>) meta.n2n_30_weight_13;
                bit<D_WORDSIZE> operand_a_30_14 = (bit<D_WORDSIZE>) meta.n2n_30_weight_14;
                bit<D_WORDSIZE> operand_a_30_15 = (bit<D_WORDSIZE>) meta.n2n_30_weight_15;
                bit<D_WORDSIZE> operand_a_30_16 = (bit<D_WORDSIZE>) meta.n2n_30_weight_16;
                bit<D_WORDSIZE> operand_a_30_17 = (bit<D_WORDSIZE>) meta.n2n_30_weight_17;
                bit<D_WORDSIZE> operand_a_30_18 = (bit<D_WORDSIZE>) meta.n2n_30_weight_18;
                bit<D_WORDSIZE> operand_a_30_19 = (bit<D_WORDSIZE>) meta.n2n_30_weight_19;
                bit<D_WORDSIZE> operand_a_30_20 = (bit<D_WORDSIZE>) meta.n2n_30_weight_20;
                bit<D_WORDSIZE> operand_a_30_21 = (bit<D_WORDSIZE>) meta.n2n_30_weight_21;
                bit<D_WORDSIZE> operand_a_30_22 = (bit<D_WORDSIZE>) meta.n2n_30_weight_22;
                bit<D_WORDSIZE> operand_a_30_23 = (bit<D_WORDSIZE>) meta.n2n_30_weight_23;
                bit<D_WORDSIZE> operand_a_30_24 = (bit<D_WORDSIZE>) meta.n2n_30_weight_24;
                bit<D_WORDSIZE> operand_a_30_25 = (bit<D_WORDSIZE>) meta.n2n_30_weight_25;
                bit<D_WORDSIZE> operand_a_30_26 = (bit<D_WORDSIZE>) meta.n2n_30_weight_26;
                bit<D_WORDSIZE> operand_a_30_27 = (bit<D_WORDSIZE>) meta.n2n_30_weight_27;
                bit<D_WORDSIZE> operand_a_30_28 = (bit<D_WORDSIZE>) meta.n2n_30_weight_28;
                bit<D_WORDSIZE> operand_a_30_29 = (bit<D_WORDSIZE>) meta.n2n_30_weight_29;
                bit<D_WORDSIZE> operand_a_30_30 = (bit<D_WORDSIZE>) meta.n2n_30_weight_30;
                bit<D_WORDSIZE> operand_a_30_31 = (bit<D_WORDSIZE>) meta.n2n_30_weight_31;
                bit<D_WORDSIZE> operand_a_30_32 = (bit<D_WORDSIZE>) meta.n2n_30_weight_32;
                // Sign extension
                if((operand_a_30_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_1;
                }
                if((operand_a_30_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_2;
                }
                if((operand_a_30_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_3;
                }
                if((operand_a_30_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_4;
                }
                if((operand_a_30_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_5;
                }
                if((operand_a_30_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_6;
                }
                if((operand_a_30_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_7;
                }
                if((operand_a_30_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_8;
                }
                if((operand_a_30_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_9;
                }
                if((operand_a_30_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_10;
                }
                if((operand_a_30_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_11;
                }
                if((operand_a_30_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_12;
                }
                if((operand_a_30_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_13;
                }
                if((operand_a_30_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_14;
                }
                if((operand_a_30_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_15;
                }
                if((operand_a_30_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_16;
                }
                if((operand_a_30_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_17;
                }
                if((operand_a_30_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_18;
                }
                if((operand_a_30_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_19;
                }
                if((operand_a_30_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_20;
                }
                if((operand_a_30_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_21;
                }
                if((operand_a_30_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_22;
                }
                if((operand_a_30_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_23;
                }
                if((operand_a_30_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_24;
                }
                if((operand_a_30_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_25;
                }
                if((operand_a_30_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_26;
                }
                if((operand_a_30_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_27;
                }
                if((operand_a_30_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_28;
                }
                if((operand_a_30_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_29;
                }
                if((operand_a_30_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_30;
                }
                if((operand_a_30_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_31;
                }
                if((operand_a_30_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_30_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_30_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_30_1 = ((operand_a_30_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_30_2 = ((operand_a_30_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_30_3 = ((operand_a_30_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_30_4 = ((operand_a_30_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_30_5 = ((operand_a_30_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_30_6 = ((operand_a_30_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_30_7 = ((operand_a_30_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_30_8 = ((operand_a_30_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_30_9 = ((operand_a_30_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_30_10 = ((operand_a_30_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_30_11 = ((operand_a_30_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_30_12 = ((operand_a_30_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_30_13 = ((operand_a_30_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_30_14 = ((operand_a_30_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_30_15 = ((operand_a_30_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_30_16 = ((operand_a_30_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_30_17 = ((operand_a_30_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_30_18 = ((operand_a_30_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_30_19 = ((operand_a_30_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_30_20 = ((operand_a_30_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_30_21 = ((operand_a_30_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_30_22 = ((operand_a_30_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_30_23 = ((operand_a_30_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_30_24 = ((operand_a_30_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_30_25 = ((operand_a_30_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_30_26 = ((operand_a_30_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_30_27 = ((operand_a_30_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_30_28 = ((operand_a_30_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_30_29 = ((operand_a_30_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_30_30 = ((operand_a_30_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_30_31 = ((operand_a_30_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_30_32 = ((operand_a_30_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_30_data = meta.neuron_30_data + (bit<WORDSIZE>) res_30_1 + (bit<WORDSIZE>) res_30_2 + (bit<WORDSIZE>) res_30_3 + (bit<WORDSIZE>) res_30_4 + (bit<WORDSIZE>) res_30_5 + (bit<WORDSIZE>) res_30_6 + (bit<WORDSIZE>) res_30_7 + (bit<WORDSIZE>) res_30_8 + (bit<WORDSIZE>) res_30_9 + (bit<WORDSIZE>) res_30_10 + (bit<WORDSIZE>) res_30_11 + (bit<WORDSIZE>) res_30_12 + (bit<WORDSIZE>) res_30_13 + (bit<WORDSIZE>) res_30_14 + (bit<WORDSIZE>) res_30_15 + (bit<WORDSIZE>) res_30_16 + (bit<WORDSIZE>) res_30_17 + (bit<WORDSIZE>) res_30_18 + (bit<WORDSIZE>) res_30_19 + (bit<WORDSIZE>) res_30_20 + (bit<WORDSIZE>) res_30_21 + (bit<WORDSIZE>) res_30_22 + (bit<WORDSIZE>) res_30_23 + (bit<WORDSIZE>) res_30_24 + (bit<WORDSIZE>) res_30_25 + (bit<WORDSIZE>) res_30_26 + (bit<WORDSIZE>) res_30_27 + (bit<WORDSIZE>) res_30_28 + (bit<WORDSIZE>) res_30_29 + (bit<WORDSIZE>) res_30_30 + (bit<WORDSIZE>) res_30_31 + (bit<WORDSIZE>) res_30_32;
                // Store data to be fowarded
                reg_neuron_30_data.write(0, meta.neuron_30_data);

                // Neuron 31:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_31_1 = (bit<D_WORDSIZE>) meta.n2n_31_weight_1;
                bit<D_WORDSIZE> operand_a_31_2 = (bit<D_WORDSIZE>) meta.n2n_31_weight_2;
                bit<D_WORDSIZE> operand_a_31_3 = (bit<D_WORDSIZE>) meta.n2n_31_weight_3;
                bit<D_WORDSIZE> operand_a_31_4 = (bit<D_WORDSIZE>) meta.n2n_31_weight_4;
                bit<D_WORDSIZE> operand_a_31_5 = (bit<D_WORDSIZE>) meta.n2n_31_weight_5;
                bit<D_WORDSIZE> operand_a_31_6 = (bit<D_WORDSIZE>) meta.n2n_31_weight_6;
                bit<D_WORDSIZE> operand_a_31_7 = (bit<D_WORDSIZE>) meta.n2n_31_weight_7;
                bit<D_WORDSIZE> operand_a_31_8 = (bit<D_WORDSIZE>) meta.n2n_31_weight_8;
                bit<D_WORDSIZE> operand_a_31_9 = (bit<D_WORDSIZE>) meta.n2n_31_weight_9;
                bit<D_WORDSIZE> operand_a_31_10 = (bit<D_WORDSIZE>) meta.n2n_31_weight_10;
                bit<D_WORDSIZE> operand_a_31_11 = (bit<D_WORDSIZE>) meta.n2n_31_weight_11;
                bit<D_WORDSIZE> operand_a_31_12 = (bit<D_WORDSIZE>) meta.n2n_31_weight_12;
                bit<D_WORDSIZE> operand_a_31_13 = (bit<D_WORDSIZE>) meta.n2n_31_weight_13;
                bit<D_WORDSIZE> operand_a_31_14 = (bit<D_WORDSIZE>) meta.n2n_31_weight_14;
                bit<D_WORDSIZE> operand_a_31_15 = (bit<D_WORDSIZE>) meta.n2n_31_weight_15;
                bit<D_WORDSIZE> operand_a_31_16 = (bit<D_WORDSIZE>) meta.n2n_31_weight_16;
                bit<D_WORDSIZE> operand_a_31_17 = (bit<D_WORDSIZE>) meta.n2n_31_weight_17;
                bit<D_WORDSIZE> operand_a_31_18 = (bit<D_WORDSIZE>) meta.n2n_31_weight_18;
                bit<D_WORDSIZE> operand_a_31_19 = (bit<D_WORDSIZE>) meta.n2n_31_weight_19;
                bit<D_WORDSIZE> operand_a_31_20 = (bit<D_WORDSIZE>) meta.n2n_31_weight_20;
                bit<D_WORDSIZE> operand_a_31_21 = (bit<D_WORDSIZE>) meta.n2n_31_weight_21;
                bit<D_WORDSIZE> operand_a_31_22 = (bit<D_WORDSIZE>) meta.n2n_31_weight_22;
                bit<D_WORDSIZE> operand_a_31_23 = (bit<D_WORDSIZE>) meta.n2n_31_weight_23;
                bit<D_WORDSIZE> operand_a_31_24 = (bit<D_WORDSIZE>) meta.n2n_31_weight_24;
                bit<D_WORDSIZE> operand_a_31_25 = (bit<D_WORDSIZE>) meta.n2n_31_weight_25;
                bit<D_WORDSIZE> operand_a_31_26 = (bit<D_WORDSIZE>) meta.n2n_31_weight_26;
                bit<D_WORDSIZE> operand_a_31_27 = (bit<D_WORDSIZE>) meta.n2n_31_weight_27;
                bit<D_WORDSIZE> operand_a_31_28 = (bit<D_WORDSIZE>) meta.n2n_31_weight_28;
                bit<D_WORDSIZE> operand_a_31_29 = (bit<D_WORDSIZE>) meta.n2n_31_weight_29;
                bit<D_WORDSIZE> operand_a_31_30 = (bit<D_WORDSIZE>) meta.n2n_31_weight_30;
                bit<D_WORDSIZE> operand_a_31_31 = (bit<D_WORDSIZE>) meta.n2n_31_weight_31;
                bit<D_WORDSIZE> operand_a_31_32 = (bit<D_WORDSIZE>) meta.n2n_31_weight_32;
                // Sign extension
                if((operand_a_31_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_1;
                }
                if((operand_a_31_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_2;
                }
                if((operand_a_31_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_3;
                }
                if((operand_a_31_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_4;
                }
                if((operand_a_31_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_5;
                }
                if((operand_a_31_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_6;
                }
                if((operand_a_31_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_7;
                }
                if((operand_a_31_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_8;
                }
                if((operand_a_31_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_9;
                }
                if((operand_a_31_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_10;
                }
                if((operand_a_31_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_11;
                }
                if((operand_a_31_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_12;
                }
                if((operand_a_31_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_13;
                }
                if((operand_a_31_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_14;
                }
                if((operand_a_31_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_15;
                }
                if((operand_a_31_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_16;
                }
                if((operand_a_31_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_17;
                }
                if((operand_a_31_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_18;
                }
                if((operand_a_31_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_19;
                }
                if((operand_a_31_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_20;
                }
                if((operand_a_31_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_21;
                }
                if((operand_a_31_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_22;
                }
                if((operand_a_31_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_23;
                }
                if((operand_a_31_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_24;
                }
                if((operand_a_31_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_25;
                }
                if((operand_a_31_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_26;
                }
                if((operand_a_31_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_27;
                }
                if((operand_a_31_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_28;
                }
                if((operand_a_31_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_29;
                }
                if((operand_a_31_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_30;
                }
                if((operand_a_31_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_31;
                }
                if((operand_a_31_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_31_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_31_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_31_1 = ((operand_a_31_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_31_2 = ((operand_a_31_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_31_3 = ((operand_a_31_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_31_4 = ((operand_a_31_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_31_5 = ((operand_a_31_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_31_6 = ((operand_a_31_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_31_7 = ((operand_a_31_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_31_8 = ((operand_a_31_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_31_9 = ((operand_a_31_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_31_10 = ((operand_a_31_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_31_11 = ((operand_a_31_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_31_12 = ((operand_a_31_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_31_13 = ((operand_a_31_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_31_14 = ((operand_a_31_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_31_15 = ((operand_a_31_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_31_16 = ((operand_a_31_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_31_17 = ((operand_a_31_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_31_18 = ((operand_a_31_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_31_19 = ((operand_a_31_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_31_20 = ((operand_a_31_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_31_21 = ((operand_a_31_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_31_22 = ((operand_a_31_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_31_23 = ((operand_a_31_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_31_24 = ((operand_a_31_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_31_25 = ((operand_a_31_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_31_26 = ((operand_a_31_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_31_27 = ((operand_a_31_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_31_28 = ((operand_a_31_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_31_29 = ((operand_a_31_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_31_30 = ((operand_a_31_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_31_31 = ((operand_a_31_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_31_32 = ((operand_a_31_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_31_data = meta.neuron_31_data + (bit<WORDSIZE>) res_31_1 + (bit<WORDSIZE>) res_31_2 + (bit<WORDSIZE>) res_31_3 + (bit<WORDSIZE>) res_31_4 + (bit<WORDSIZE>) res_31_5 + (bit<WORDSIZE>) res_31_6 + (bit<WORDSIZE>) res_31_7 + (bit<WORDSIZE>) res_31_8 + (bit<WORDSIZE>) res_31_9 + (bit<WORDSIZE>) res_31_10 + (bit<WORDSIZE>) res_31_11 + (bit<WORDSIZE>) res_31_12 + (bit<WORDSIZE>) res_31_13 + (bit<WORDSIZE>) res_31_14 + (bit<WORDSIZE>) res_31_15 + (bit<WORDSIZE>) res_31_16 + (bit<WORDSIZE>) res_31_17 + (bit<WORDSIZE>) res_31_18 + (bit<WORDSIZE>) res_31_19 + (bit<WORDSIZE>) res_31_20 + (bit<WORDSIZE>) res_31_21 + (bit<WORDSIZE>) res_31_22 + (bit<WORDSIZE>) res_31_23 + (bit<WORDSIZE>) res_31_24 + (bit<WORDSIZE>) res_31_25 + (bit<WORDSIZE>) res_31_26 + (bit<WORDSIZE>) res_31_27 + (bit<WORDSIZE>) res_31_28 + (bit<WORDSIZE>) res_31_29 + (bit<WORDSIZE>) res_31_30 + (bit<WORDSIZE>) res_31_31 + (bit<WORDSIZE>) res_31_32;
                // Store data to be fowarded
                reg_neuron_31_data.write(0, meta.neuron_31_data);

                // Neuron 32:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_32_1 = (bit<D_WORDSIZE>) meta.n2n_32_weight_1;
                bit<D_WORDSIZE> operand_a_32_2 = (bit<D_WORDSIZE>) meta.n2n_32_weight_2;
                bit<D_WORDSIZE> operand_a_32_3 = (bit<D_WORDSIZE>) meta.n2n_32_weight_3;
                bit<D_WORDSIZE> operand_a_32_4 = (bit<D_WORDSIZE>) meta.n2n_32_weight_4;
                bit<D_WORDSIZE> operand_a_32_5 = (bit<D_WORDSIZE>) meta.n2n_32_weight_5;
                bit<D_WORDSIZE> operand_a_32_6 = (bit<D_WORDSIZE>) meta.n2n_32_weight_6;
                bit<D_WORDSIZE> operand_a_32_7 = (bit<D_WORDSIZE>) meta.n2n_32_weight_7;
                bit<D_WORDSIZE> operand_a_32_8 = (bit<D_WORDSIZE>) meta.n2n_32_weight_8;
                bit<D_WORDSIZE> operand_a_32_9 = (bit<D_WORDSIZE>) meta.n2n_32_weight_9;
                bit<D_WORDSIZE> operand_a_32_10 = (bit<D_WORDSIZE>) meta.n2n_32_weight_10;
                bit<D_WORDSIZE> operand_a_32_11 = (bit<D_WORDSIZE>) meta.n2n_32_weight_11;
                bit<D_WORDSIZE> operand_a_32_12 = (bit<D_WORDSIZE>) meta.n2n_32_weight_12;
                bit<D_WORDSIZE> operand_a_32_13 = (bit<D_WORDSIZE>) meta.n2n_32_weight_13;
                bit<D_WORDSIZE> operand_a_32_14 = (bit<D_WORDSIZE>) meta.n2n_32_weight_14;
                bit<D_WORDSIZE> operand_a_32_15 = (bit<D_WORDSIZE>) meta.n2n_32_weight_15;
                bit<D_WORDSIZE> operand_a_32_16 = (bit<D_WORDSIZE>) meta.n2n_32_weight_16;
                bit<D_WORDSIZE> operand_a_32_17 = (bit<D_WORDSIZE>) meta.n2n_32_weight_17;
                bit<D_WORDSIZE> operand_a_32_18 = (bit<D_WORDSIZE>) meta.n2n_32_weight_18;
                bit<D_WORDSIZE> operand_a_32_19 = (bit<D_WORDSIZE>) meta.n2n_32_weight_19;
                bit<D_WORDSIZE> operand_a_32_20 = (bit<D_WORDSIZE>) meta.n2n_32_weight_20;
                bit<D_WORDSIZE> operand_a_32_21 = (bit<D_WORDSIZE>) meta.n2n_32_weight_21;
                bit<D_WORDSIZE> operand_a_32_22 = (bit<D_WORDSIZE>) meta.n2n_32_weight_22;
                bit<D_WORDSIZE> operand_a_32_23 = (bit<D_WORDSIZE>) meta.n2n_32_weight_23;
                bit<D_WORDSIZE> operand_a_32_24 = (bit<D_WORDSIZE>) meta.n2n_32_weight_24;
                bit<D_WORDSIZE> operand_a_32_25 = (bit<D_WORDSIZE>) meta.n2n_32_weight_25;
                bit<D_WORDSIZE> operand_a_32_26 = (bit<D_WORDSIZE>) meta.n2n_32_weight_26;
                bit<D_WORDSIZE> operand_a_32_27 = (bit<D_WORDSIZE>) meta.n2n_32_weight_27;
                bit<D_WORDSIZE> operand_a_32_28 = (bit<D_WORDSIZE>) meta.n2n_32_weight_28;
                bit<D_WORDSIZE> operand_a_32_29 = (bit<D_WORDSIZE>) meta.n2n_32_weight_29;
                bit<D_WORDSIZE> operand_a_32_30 = (bit<D_WORDSIZE>) meta.n2n_32_weight_30;
                bit<D_WORDSIZE> operand_a_32_31 = (bit<D_WORDSIZE>) meta.n2n_32_weight_31;
                bit<D_WORDSIZE> operand_a_32_32 = (bit<D_WORDSIZE>) meta.n2n_32_weight_32;
                // Sign extension
                if((operand_a_32_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_1;
                }
                if((operand_a_32_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_2;
                }
                if((operand_a_32_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_3;
                }
                if((operand_a_32_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_4;
                }
                if((operand_a_32_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_5;
                }
                if((operand_a_32_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_6;
                }
                if((operand_a_32_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_7;
                }
                if((operand_a_32_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_8;
                }
                if((operand_a_32_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_9;
                }
                if((operand_a_32_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_10;
                }
                if((operand_a_32_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_11;
                }
                if((operand_a_32_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_12;
                }
                if((operand_a_32_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_13;
                }
                if((operand_a_32_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_14;
                }
                if((operand_a_32_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_15;
                }
                if((operand_a_32_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_16;
                }
                if((operand_a_32_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_17;
                }
                if((operand_a_32_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_18;
                }
                if((operand_a_32_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_19;
                }
                if((operand_a_32_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_20;
                }
                if((operand_a_32_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_21;
                }
                if((operand_a_32_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_22;
                }
                if((operand_a_32_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_23;
                }
                if((operand_a_32_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_24;
                }
                if((operand_a_32_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_25;
                }
                if((operand_a_32_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_26;
                }
                if((operand_a_32_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_27;
                }
                if((operand_a_32_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_28;
                }
                if((operand_a_32_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_29;
                }
                if((operand_a_32_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_30;
                }
                if((operand_a_32_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_31;
                }
                if((operand_a_32_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_32_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_32_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_32_1 = ((operand_a_32_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_32_2 = ((operand_a_32_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_32_3 = ((operand_a_32_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_32_4 = ((operand_a_32_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_32_5 = ((operand_a_32_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_32_6 = ((operand_a_32_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_32_7 = ((operand_a_32_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_32_8 = ((operand_a_32_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_32_9 = ((operand_a_32_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_32_10 = ((operand_a_32_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_32_11 = ((operand_a_32_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_32_12 = ((operand_a_32_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_32_13 = ((operand_a_32_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_32_14 = ((operand_a_32_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_32_15 = ((operand_a_32_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_32_16 = ((operand_a_32_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_32_17 = ((operand_a_32_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_32_18 = ((operand_a_32_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_32_19 = ((operand_a_32_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_32_20 = ((operand_a_32_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_32_21 = ((operand_a_32_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_32_22 = ((operand_a_32_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_32_23 = ((operand_a_32_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_32_24 = ((operand_a_32_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_32_25 = ((operand_a_32_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_32_26 = ((operand_a_32_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_32_27 = ((operand_a_32_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_32_28 = ((operand_a_32_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_32_29 = ((operand_a_32_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_32_30 = ((operand_a_32_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_32_31 = ((operand_a_32_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_32_32 = ((operand_a_32_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_32_data = meta.neuron_32_data + (bit<WORDSIZE>) res_32_1 + (bit<WORDSIZE>) res_32_2 + (bit<WORDSIZE>) res_32_3 + (bit<WORDSIZE>) res_32_4 + (bit<WORDSIZE>) res_32_5 + (bit<WORDSIZE>) res_32_6 + (bit<WORDSIZE>) res_32_7 + (bit<WORDSIZE>) res_32_8 + (bit<WORDSIZE>) res_32_9 + (bit<WORDSIZE>) res_32_10 + (bit<WORDSIZE>) res_32_11 + (bit<WORDSIZE>) res_32_12 + (bit<WORDSIZE>) res_32_13 + (bit<WORDSIZE>) res_32_14 + (bit<WORDSIZE>) res_32_15 + (bit<WORDSIZE>) res_32_16 + (bit<WORDSIZE>) res_32_17 + (bit<WORDSIZE>) res_32_18 + (bit<WORDSIZE>) res_32_19 + (bit<WORDSIZE>) res_32_20 + (bit<WORDSIZE>) res_32_21 + (bit<WORDSIZE>) res_32_22 + (bit<WORDSIZE>) res_32_23 + (bit<WORDSIZE>) res_32_24 + (bit<WORDSIZE>) res_32_25 + (bit<WORDSIZE>) res_32_26 + (bit<WORDSIZE>) res_32_27 + (bit<WORDSIZE>) res_32_28 + (bit<WORDSIZE>) res_32_29 + (bit<WORDSIZE>) res_32_30 + (bit<WORDSIZE>) res_32_31 + (bit<WORDSIZE>) res_32_32;
                // Store data to be fowarded
                reg_neuron_32_data.write(0, meta.neuron_32_data);
            }
            else if(meta.agg_func == FUNC_WEIGHTED_SUM_32_TO_3){                // Aggregation Function = weighted sum = bias + Summation_i=1_to_n(data_i * weight_i)
                if(meta.n_received_stimuli == 1){ // Check if this is the first stimulus in an ANN run
                    // If yes, initialize neuron_data with the neuron bias, the neuron bias is added to the accumulator (neuron_data) just once
                    meta.neuron_1_data = meta.neuron_1_bias;
                    meta.neuron_2_data = meta.neuron_2_bias;
                    meta.neuron_3_data = meta.neuron_3_bias;
                }
                else{
                    // If not, read the neuron_data value stored in the register
                    reg_neuron_1_data.read(meta.neuron_1_data, 0);
                    reg_neuron_2_data.read(meta.neuron_2_data, 0);
                    reg_neuron_3_data.read(meta.neuron_3_data, 0);
                }
                tab_n2n_weight_32_to_3_neurons.apply();	// Get the neuron weights
                // Load data and perform sign extension

                bit<D_WORDSIZE> operand_b1 = (bit<D_WORDSIZE>) hdr.ann.data_1;
                // Sign extension
                if((operand_b1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b1;
                }
                bit<D_WORDSIZE> operand_b2 = (bit<D_WORDSIZE>) hdr.ann.data_2;
                // Sign extension
                if((operand_b2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b2;
                }
                bit<D_WORDSIZE> operand_b3 = (bit<D_WORDSIZE>) hdr.ann.data_3;
                // Sign extension
                if((operand_b3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b3;
                }
                bit<D_WORDSIZE> operand_b4 = (bit<D_WORDSIZE>) hdr.ann.data_4;
                // Sign extension
                if((operand_b4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b4;
                }
                bit<D_WORDSIZE> operand_b5 = (bit<D_WORDSIZE>) hdr.ann.data_5;
                // Sign extension
                if((operand_b5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b5;
                }
                bit<D_WORDSIZE> operand_b6 = (bit<D_WORDSIZE>) hdr.ann.data_6;
                // Sign extension
                if((operand_b6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b6;
                }
                bit<D_WORDSIZE> operand_b7 = (bit<D_WORDSIZE>) hdr.ann.data_7;
                // Sign extension
                if((operand_b7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b7;
                }
                bit<D_WORDSIZE> operand_b8 = (bit<D_WORDSIZE>) hdr.ann.data_8;
                // Sign extension
                if((operand_b8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b8;
                }
                bit<D_WORDSIZE> operand_b9 = (bit<D_WORDSIZE>) hdr.ann.data_9;
                // Sign extension
                if((operand_b9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b9;
                }
                bit<D_WORDSIZE> operand_b10 = (bit<D_WORDSIZE>) hdr.ann.data_10;
                // Sign extension
                if((operand_b10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b10;
                }
                bit<D_WORDSIZE> operand_b11 = (bit<D_WORDSIZE>) hdr.ann.data_11;
                // Sign extension
                if((operand_b11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b11;
                }
                bit<D_WORDSIZE> operand_b12 = (bit<D_WORDSIZE>) hdr.ann.data_12;
                // Sign extension
                if((operand_b12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b12;
                }
                bit<D_WORDSIZE> operand_b13 = (bit<D_WORDSIZE>) hdr.ann.data_13;
                // Sign extension
                if((operand_b13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b13;
                }
                bit<D_WORDSIZE> operand_b14 = (bit<D_WORDSIZE>) hdr.ann.data_14;
                // Sign extension
                if((operand_b14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b14;
                }
                bit<D_WORDSIZE> operand_b15 = (bit<D_WORDSIZE>) hdr.ann.data_15;
                // Sign extension
                if((operand_b15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b15;
                }
                bit<D_WORDSIZE> operand_b16 = (bit<D_WORDSIZE>) hdr.ann.data_16;
                // Sign extension
                if((operand_b16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b16;
                }
                bit<D_WORDSIZE> operand_b17 = (bit<D_WORDSIZE>) hdr.ann.data_17;
                // Sign extension
                if((operand_b17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b17;
                }
                bit<D_WORDSIZE> operand_b18 = (bit<D_WORDSIZE>) hdr.ann.data_18;
                // Sign extension
                if((operand_b18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b18;
                }
                bit<D_WORDSIZE> operand_b19 = (bit<D_WORDSIZE>) hdr.ann.data_19;
                // Sign extension
                if((operand_b19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b19;
                }
                bit<D_WORDSIZE> operand_b20 = (bit<D_WORDSIZE>) hdr.ann.data_20;
                // Sign extension
                if((operand_b20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b20;
                }
                bit<D_WORDSIZE> operand_b21 = (bit<D_WORDSIZE>) hdr.ann.data_21;
                // Sign extension
                if((operand_b21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b21;
                }
                bit<D_WORDSIZE> operand_b22 = (bit<D_WORDSIZE>) hdr.ann.data_22;
                // Sign extension
                if((operand_b22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b22;
                }
                bit<D_WORDSIZE> operand_b23 = (bit<D_WORDSIZE>) hdr.ann.data_23;
                // Sign extension
                if((operand_b23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b23;
                }
                bit<D_WORDSIZE> operand_b24 = (bit<D_WORDSIZE>) hdr.ann.data_24;
                // Sign extension
                if((operand_b24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b24;
                }
                bit<D_WORDSIZE> operand_b25 = (bit<D_WORDSIZE>) hdr.ann.data_25;
                // Sign extension
                if((operand_b25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b25;
                }
                bit<D_WORDSIZE> operand_b26 = (bit<D_WORDSIZE>) hdr.ann.data_26;
                // Sign extension
                if((operand_b26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b26;
                }
                bit<D_WORDSIZE> operand_b27 = (bit<D_WORDSIZE>) hdr.ann.data_27;
                // Sign extension
                if((operand_b27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b27;
                }
                bit<D_WORDSIZE> operand_b28 = (bit<D_WORDSIZE>) hdr.ann.data_28;
                // Sign extension
                if((operand_b28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b28;
                }
                bit<D_WORDSIZE> operand_b29 = (bit<D_WORDSIZE>) hdr.ann.data_29;
                // Sign extension
                if((operand_b29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b29;
                }
                bit<D_WORDSIZE> operand_b30 = (bit<D_WORDSIZE>) hdr.ann.data_30;
                // Sign extension
                if((operand_b30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b30;
                }
                bit<D_WORDSIZE> operand_b31 = (bit<D_WORDSIZE>) hdr.ann.data_31;
                // Sign extension
                if((operand_b31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b31;
                }
                bit<D_WORDSIZE> operand_b32 = (bit<D_WORDSIZE>) hdr.ann.data_32;
                // Sign extension
                if((operand_b32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_b32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_b32;
                }
                // Neuron 1:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_1_1 = (bit<D_WORDSIZE>) meta.n2n_1_weight_1;
                bit<D_WORDSIZE> operand_a_1_2 = (bit<D_WORDSIZE>) meta.n2n_1_weight_2;
                bit<D_WORDSIZE> operand_a_1_3 = (bit<D_WORDSIZE>) meta.n2n_1_weight_3;
                bit<D_WORDSIZE> operand_a_1_4 = (bit<D_WORDSIZE>) meta.n2n_1_weight_4;
                bit<D_WORDSIZE> operand_a_1_5 = (bit<D_WORDSIZE>) meta.n2n_1_weight_5;
                bit<D_WORDSIZE> operand_a_1_6 = (bit<D_WORDSIZE>) meta.n2n_1_weight_6;
                bit<D_WORDSIZE> operand_a_1_7 = (bit<D_WORDSIZE>) meta.n2n_1_weight_7;
                bit<D_WORDSIZE> operand_a_1_8 = (bit<D_WORDSIZE>) meta.n2n_1_weight_8;
                bit<D_WORDSIZE> operand_a_1_9 = (bit<D_WORDSIZE>) meta.n2n_1_weight_9;
                bit<D_WORDSIZE> operand_a_1_10 = (bit<D_WORDSIZE>) meta.n2n_1_weight_10;
                bit<D_WORDSIZE> operand_a_1_11 = (bit<D_WORDSIZE>) meta.n2n_1_weight_11;
                bit<D_WORDSIZE> operand_a_1_12 = (bit<D_WORDSIZE>) meta.n2n_1_weight_12;
                bit<D_WORDSIZE> operand_a_1_13 = (bit<D_WORDSIZE>) meta.n2n_1_weight_13;
                bit<D_WORDSIZE> operand_a_1_14 = (bit<D_WORDSIZE>) meta.n2n_1_weight_14;
                bit<D_WORDSIZE> operand_a_1_15 = (bit<D_WORDSIZE>) meta.n2n_1_weight_15;
                bit<D_WORDSIZE> operand_a_1_16 = (bit<D_WORDSIZE>) meta.n2n_1_weight_16;
                bit<D_WORDSIZE> operand_a_1_17 = (bit<D_WORDSIZE>) meta.n2n_1_weight_17;
                bit<D_WORDSIZE> operand_a_1_18 = (bit<D_WORDSIZE>) meta.n2n_1_weight_18;
                bit<D_WORDSIZE> operand_a_1_19 = (bit<D_WORDSIZE>) meta.n2n_1_weight_19;
                bit<D_WORDSIZE> operand_a_1_20 = (bit<D_WORDSIZE>) meta.n2n_1_weight_20;
                bit<D_WORDSIZE> operand_a_1_21 = (bit<D_WORDSIZE>) meta.n2n_1_weight_21;
                bit<D_WORDSIZE> operand_a_1_22 = (bit<D_WORDSIZE>) meta.n2n_1_weight_22;
                bit<D_WORDSIZE> operand_a_1_23 = (bit<D_WORDSIZE>) meta.n2n_1_weight_23;
                bit<D_WORDSIZE> operand_a_1_24 = (bit<D_WORDSIZE>) meta.n2n_1_weight_24;
                bit<D_WORDSIZE> operand_a_1_25 = (bit<D_WORDSIZE>) meta.n2n_1_weight_25;
                bit<D_WORDSIZE> operand_a_1_26 = (bit<D_WORDSIZE>) meta.n2n_1_weight_26;
                bit<D_WORDSIZE> operand_a_1_27 = (bit<D_WORDSIZE>) meta.n2n_1_weight_27;
                bit<D_WORDSIZE> operand_a_1_28 = (bit<D_WORDSIZE>) meta.n2n_1_weight_28;
                bit<D_WORDSIZE> operand_a_1_29 = (bit<D_WORDSIZE>) meta.n2n_1_weight_29;
                bit<D_WORDSIZE> operand_a_1_30 = (bit<D_WORDSIZE>) meta.n2n_1_weight_30;
                bit<D_WORDSIZE> operand_a_1_31 = (bit<D_WORDSIZE>) meta.n2n_1_weight_31;
                bit<D_WORDSIZE> operand_a_1_32 = (bit<D_WORDSIZE>) meta.n2n_1_weight_32;
                // Sign extension
                if((operand_a_1_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_1;
                }
                if((operand_a_1_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_2;
                }
                if((operand_a_1_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_3;
                }
                if((operand_a_1_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_4;
                }
                if((operand_a_1_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_5;
                }
                if((operand_a_1_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_6;
                }
                if((operand_a_1_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_7;
                }
                if((operand_a_1_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_8;
                }
                if((operand_a_1_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_9;
                }
                if((operand_a_1_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_10;
                }
                if((operand_a_1_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_11;
                }
                if((operand_a_1_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_12;
                }
                if((operand_a_1_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_13;
                }
                if((operand_a_1_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_14;
                }
                if((operand_a_1_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_15;
                }
                if((operand_a_1_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_16;
                }
                if((operand_a_1_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_17;
                }
                if((operand_a_1_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_18;
                }
                if((operand_a_1_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_19;
                }
                if((operand_a_1_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_20;
                }
                if((operand_a_1_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_21;
                }
                if((operand_a_1_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_22;
                }
                if((operand_a_1_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_23;
                }
                if((operand_a_1_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_24;
                }
                if((operand_a_1_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_25;
                }
                if((operand_a_1_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_26;
                }
                if((operand_a_1_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_27;
                }
                if((operand_a_1_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_28;
                }
                if((operand_a_1_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_29;
                }
                if((operand_a_1_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_30;
                }
                if((operand_a_1_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_31;
                }
                if((operand_a_1_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_1_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_1_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_1_1 = ((operand_a_1_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_1_2 = ((operand_a_1_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_1_3 = ((operand_a_1_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_1_4 = ((operand_a_1_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_1_5 = ((operand_a_1_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_1_6 = ((operand_a_1_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_1_7 = ((operand_a_1_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_1_8 = ((operand_a_1_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_1_9 = ((operand_a_1_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_1_10 = ((operand_a_1_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_1_11 = ((operand_a_1_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_1_12 = ((operand_a_1_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_1_13 = ((operand_a_1_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_1_14 = ((operand_a_1_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_1_15 = ((operand_a_1_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_1_16 = ((operand_a_1_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_1_17 = ((operand_a_1_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_1_18 = ((operand_a_1_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_1_19 = ((operand_a_1_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_1_20 = ((operand_a_1_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_1_21 = ((operand_a_1_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_1_22 = ((operand_a_1_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_1_23 = ((operand_a_1_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_1_24 = ((operand_a_1_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_1_25 = ((operand_a_1_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_1_26 = ((operand_a_1_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_1_27 = ((operand_a_1_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_1_28 = ((operand_a_1_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_1_29 = ((operand_a_1_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_1_30 = ((operand_a_1_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_1_31 = ((operand_a_1_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_1_32 = ((operand_a_1_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_1_data = meta.neuron_1_data + (bit<WORDSIZE>) res_1_1 + (bit<WORDSIZE>) res_1_2 + (bit<WORDSIZE>) res_1_3 + (bit<WORDSIZE>) res_1_4 + (bit<WORDSIZE>) res_1_5 + (bit<WORDSIZE>) res_1_6 + (bit<WORDSIZE>) res_1_7 + (bit<WORDSIZE>) res_1_8 + (bit<WORDSIZE>) res_1_9 + (bit<WORDSIZE>) res_1_10 + (bit<WORDSIZE>) res_1_11 + (bit<WORDSIZE>) res_1_12 + (bit<WORDSIZE>) res_1_13 + (bit<WORDSIZE>) res_1_14 + (bit<WORDSIZE>) res_1_15 + (bit<WORDSIZE>) res_1_16 + (bit<WORDSIZE>) res_1_17 + (bit<WORDSIZE>) res_1_18 + (bit<WORDSIZE>) res_1_19 + (bit<WORDSIZE>) res_1_20 + (bit<WORDSIZE>) res_1_21 + (bit<WORDSIZE>) res_1_22 + (bit<WORDSIZE>) res_1_23 + (bit<WORDSIZE>) res_1_24 + (bit<WORDSIZE>) res_1_25 + (bit<WORDSIZE>) res_1_26 + (bit<WORDSIZE>) res_1_27 + (bit<WORDSIZE>) res_1_28 + (bit<WORDSIZE>) res_1_29 + (bit<WORDSIZE>) res_1_30 + (bit<WORDSIZE>) res_1_31 + (bit<WORDSIZE>) res_1_32;
                // Store data to be fowarded
                reg_neuron_1_data.write(0, meta.neuron_1_data);

                // Neuron 2:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_2_1 = (bit<D_WORDSIZE>) meta.n2n_2_weight_1;
                bit<D_WORDSIZE> operand_a_2_2 = (bit<D_WORDSIZE>) meta.n2n_2_weight_2;
                bit<D_WORDSIZE> operand_a_2_3 = (bit<D_WORDSIZE>) meta.n2n_2_weight_3;
                bit<D_WORDSIZE> operand_a_2_4 = (bit<D_WORDSIZE>) meta.n2n_2_weight_4;
                bit<D_WORDSIZE> operand_a_2_5 = (bit<D_WORDSIZE>) meta.n2n_2_weight_5;
                bit<D_WORDSIZE> operand_a_2_6 = (bit<D_WORDSIZE>) meta.n2n_2_weight_6;
                bit<D_WORDSIZE> operand_a_2_7 = (bit<D_WORDSIZE>) meta.n2n_2_weight_7;
                bit<D_WORDSIZE> operand_a_2_8 = (bit<D_WORDSIZE>) meta.n2n_2_weight_8;
                bit<D_WORDSIZE> operand_a_2_9 = (bit<D_WORDSIZE>) meta.n2n_2_weight_9;
                bit<D_WORDSIZE> operand_a_2_10 = (bit<D_WORDSIZE>) meta.n2n_2_weight_10;
                bit<D_WORDSIZE> operand_a_2_11 = (bit<D_WORDSIZE>) meta.n2n_2_weight_11;
                bit<D_WORDSIZE> operand_a_2_12 = (bit<D_WORDSIZE>) meta.n2n_2_weight_12;
                bit<D_WORDSIZE> operand_a_2_13 = (bit<D_WORDSIZE>) meta.n2n_2_weight_13;
                bit<D_WORDSIZE> operand_a_2_14 = (bit<D_WORDSIZE>) meta.n2n_2_weight_14;
                bit<D_WORDSIZE> operand_a_2_15 = (bit<D_WORDSIZE>) meta.n2n_2_weight_15;
                bit<D_WORDSIZE> operand_a_2_16 = (bit<D_WORDSIZE>) meta.n2n_2_weight_16;
                bit<D_WORDSIZE> operand_a_2_17 = (bit<D_WORDSIZE>) meta.n2n_2_weight_17;
                bit<D_WORDSIZE> operand_a_2_18 = (bit<D_WORDSIZE>) meta.n2n_2_weight_18;
                bit<D_WORDSIZE> operand_a_2_19 = (bit<D_WORDSIZE>) meta.n2n_2_weight_19;
                bit<D_WORDSIZE> operand_a_2_20 = (bit<D_WORDSIZE>) meta.n2n_2_weight_20;
                bit<D_WORDSIZE> operand_a_2_21 = (bit<D_WORDSIZE>) meta.n2n_2_weight_21;
                bit<D_WORDSIZE> operand_a_2_22 = (bit<D_WORDSIZE>) meta.n2n_2_weight_22;
                bit<D_WORDSIZE> operand_a_2_23 = (bit<D_WORDSIZE>) meta.n2n_2_weight_23;
                bit<D_WORDSIZE> operand_a_2_24 = (bit<D_WORDSIZE>) meta.n2n_2_weight_24;
                bit<D_WORDSIZE> operand_a_2_25 = (bit<D_WORDSIZE>) meta.n2n_2_weight_25;
                bit<D_WORDSIZE> operand_a_2_26 = (bit<D_WORDSIZE>) meta.n2n_2_weight_26;
                bit<D_WORDSIZE> operand_a_2_27 = (bit<D_WORDSIZE>) meta.n2n_2_weight_27;
                bit<D_WORDSIZE> operand_a_2_28 = (bit<D_WORDSIZE>) meta.n2n_2_weight_28;
                bit<D_WORDSIZE> operand_a_2_29 = (bit<D_WORDSIZE>) meta.n2n_2_weight_29;
                bit<D_WORDSIZE> operand_a_2_30 = (bit<D_WORDSIZE>) meta.n2n_2_weight_30;
                bit<D_WORDSIZE> operand_a_2_31 = (bit<D_WORDSIZE>) meta.n2n_2_weight_31;
                bit<D_WORDSIZE> operand_a_2_32 = (bit<D_WORDSIZE>) meta.n2n_2_weight_32;
                // Sign extension
                if((operand_a_2_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_1;
                }
                if((operand_a_2_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_2;
                }
                if((operand_a_2_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_3;
                }
                if((operand_a_2_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_4;
                }
                if((operand_a_2_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_5;
                }
                if((operand_a_2_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_6;
                }
                if((operand_a_2_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_7;
                }
                if((operand_a_2_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_8;
                }
                if((operand_a_2_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_9;
                }
                if((operand_a_2_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_10;
                }
                if((operand_a_2_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_11;
                }
                if((operand_a_2_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_12;
                }
                if((operand_a_2_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_13;
                }
                if((operand_a_2_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_14;
                }
                if((operand_a_2_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_15;
                }
                if((operand_a_2_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_16;
                }
                if((operand_a_2_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_17;
                }
                if((operand_a_2_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_18;
                }
                if((operand_a_2_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_19;
                }
                if((operand_a_2_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_20;
                }
                if((operand_a_2_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_21;
                }
                if((operand_a_2_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_22;
                }
                if((operand_a_2_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_23;
                }
                if((operand_a_2_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_24;
                }
                if((operand_a_2_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_25;
                }
                if((operand_a_2_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_26;
                }
                if((operand_a_2_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_27;
                }
                if((operand_a_2_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_28;
                }
                if((operand_a_2_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_29;
                }
                if((operand_a_2_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_30;
                }
                if((operand_a_2_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_31;
                }
                if((operand_a_2_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_2_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_2_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_2_1 = ((operand_a_2_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_2_2 = ((operand_a_2_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_2_3 = ((operand_a_2_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_2_4 = ((operand_a_2_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_2_5 = ((operand_a_2_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_2_6 = ((operand_a_2_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_2_7 = ((operand_a_2_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_2_8 = ((operand_a_2_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_2_9 = ((operand_a_2_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_2_10 = ((operand_a_2_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_2_11 = ((operand_a_2_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_2_12 = ((operand_a_2_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_2_13 = ((operand_a_2_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_2_14 = ((operand_a_2_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_2_15 = ((operand_a_2_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_2_16 = ((operand_a_2_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_2_17 = ((operand_a_2_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_2_18 = ((operand_a_2_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_2_19 = ((operand_a_2_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_2_20 = ((operand_a_2_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_2_21 = ((operand_a_2_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_2_22 = ((operand_a_2_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_2_23 = ((operand_a_2_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_2_24 = ((operand_a_2_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_2_25 = ((operand_a_2_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_2_26 = ((operand_a_2_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_2_27 = ((operand_a_2_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_2_28 = ((operand_a_2_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_2_29 = ((operand_a_2_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_2_30 = ((operand_a_2_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_2_31 = ((operand_a_2_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_2_32 = ((operand_a_2_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_2_data = meta.neuron_2_data + (bit<WORDSIZE>) res_2_1 + (bit<WORDSIZE>) res_2_2 + (bit<WORDSIZE>) res_2_3 + (bit<WORDSIZE>) res_2_4 + (bit<WORDSIZE>) res_2_5 + (bit<WORDSIZE>) res_2_6 + (bit<WORDSIZE>) res_2_7 + (bit<WORDSIZE>) res_2_8 + (bit<WORDSIZE>) res_2_9 + (bit<WORDSIZE>) res_2_10 + (bit<WORDSIZE>) res_2_11 + (bit<WORDSIZE>) res_2_12 + (bit<WORDSIZE>) res_2_13 + (bit<WORDSIZE>) res_2_14 + (bit<WORDSIZE>) res_2_15 + (bit<WORDSIZE>) res_2_16 + (bit<WORDSIZE>) res_2_17 + (bit<WORDSIZE>) res_2_18 + (bit<WORDSIZE>) res_2_19 + (bit<WORDSIZE>) res_2_20 + (bit<WORDSIZE>) res_2_21 + (bit<WORDSIZE>) res_2_22 + (bit<WORDSIZE>) res_2_23 + (bit<WORDSIZE>) res_2_24 + (bit<WORDSIZE>) res_2_25 + (bit<WORDSIZE>) res_2_26 + (bit<WORDSIZE>) res_2_27 + (bit<WORDSIZE>) res_2_28 + (bit<WORDSIZE>) res_2_29 + (bit<WORDSIZE>) res_2_30 + (bit<WORDSIZE>) res_2_31 + (bit<WORDSIZE>) res_2_32;
                // Store data to be fowarded
                reg_neuron_2_data.write(0, meta.neuron_2_data);

                // Neuron 3:
                // Pass values to aux variable to be able to operate them
                bit<D_WORDSIZE> operand_a_3_1 = (bit<D_WORDSIZE>) meta.n2n_3_weight_1;
                bit<D_WORDSIZE> operand_a_3_2 = (bit<D_WORDSIZE>) meta.n2n_3_weight_2;
                bit<D_WORDSIZE> operand_a_3_3 = (bit<D_WORDSIZE>) meta.n2n_3_weight_3;
                bit<D_WORDSIZE> operand_a_3_4 = (bit<D_WORDSIZE>) meta.n2n_3_weight_4;
                bit<D_WORDSIZE> operand_a_3_5 = (bit<D_WORDSIZE>) meta.n2n_3_weight_5;
                bit<D_WORDSIZE> operand_a_3_6 = (bit<D_WORDSIZE>) meta.n2n_3_weight_6;
                bit<D_WORDSIZE> operand_a_3_7 = (bit<D_WORDSIZE>) meta.n2n_3_weight_7;
                bit<D_WORDSIZE> operand_a_3_8 = (bit<D_WORDSIZE>) meta.n2n_3_weight_8;
                bit<D_WORDSIZE> operand_a_3_9 = (bit<D_WORDSIZE>) meta.n2n_3_weight_9;
                bit<D_WORDSIZE> operand_a_3_10 = (bit<D_WORDSIZE>) meta.n2n_3_weight_10;
                bit<D_WORDSIZE> operand_a_3_11 = (bit<D_WORDSIZE>) meta.n2n_3_weight_11;
                bit<D_WORDSIZE> operand_a_3_12 = (bit<D_WORDSIZE>) meta.n2n_3_weight_12;
                bit<D_WORDSIZE> operand_a_3_13 = (bit<D_WORDSIZE>) meta.n2n_3_weight_13;
                bit<D_WORDSIZE> operand_a_3_14 = (bit<D_WORDSIZE>) meta.n2n_3_weight_14;
                bit<D_WORDSIZE> operand_a_3_15 = (bit<D_WORDSIZE>) meta.n2n_3_weight_15;
                bit<D_WORDSIZE> operand_a_3_16 = (bit<D_WORDSIZE>) meta.n2n_3_weight_16;
                bit<D_WORDSIZE> operand_a_3_17 = (bit<D_WORDSIZE>) meta.n2n_3_weight_17;
                bit<D_WORDSIZE> operand_a_3_18 = (bit<D_WORDSIZE>) meta.n2n_3_weight_18;
                bit<D_WORDSIZE> operand_a_3_19 = (bit<D_WORDSIZE>) meta.n2n_3_weight_19;
                bit<D_WORDSIZE> operand_a_3_20 = (bit<D_WORDSIZE>) meta.n2n_3_weight_20;
                bit<D_WORDSIZE> operand_a_3_21 = (bit<D_WORDSIZE>) meta.n2n_3_weight_21;
                bit<D_WORDSIZE> operand_a_3_22 = (bit<D_WORDSIZE>) meta.n2n_3_weight_22;
                bit<D_WORDSIZE> operand_a_3_23 = (bit<D_WORDSIZE>) meta.n2n_3_weight_23;
                bit<D_WORDSIZE> operand_a_3_24 = (bit<D_WORDSIZE>) meta.n2n_3_weight_24;
                bit<D_WORDSIZE> operand_a_3_25 = (bit<D_WORDSIZE>) meta.n2n_3_weight_25;
                bit<D_WORDSIZE> operand_a_3_26 = (bit<D_WORDSIZE>) meta.n2n_3_weight_26;
                bit<D_WORDSIZE> operand_a_3_27 = (bit<D_WORDSIZE>) meta.n2n_3_weight_27;
                bit<D_WORDSIZE> operand_a_3_28 = (bit<D_WORDSIZE>) meta.n2n_3_weight_28;
                bit<D_WORDSIZE> operand_a_3_29 = (bit<D_WORDSIZE>) meta.n2n_3_weight_29;
                bit<D_WORDSIZE> operand_a_3_30 = (bit<D_WORDSIZE>) meta.n2n_3_weight_30;
                bit<D_WORDSIZE> operand_a_3_31 = (bit<D_WORDSIZE>) meta.n2n_3_weight_31;
                bit<D_WORDSIZE> operand_a_3_32 = (bit<D_WORDSIZE>) meta.n2n_3_weight_32;
                // Sign extension
                if((operand_a_3_1 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_1 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_1;
                }
                if((operand_a_3_2 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_2 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_2;
                }
                if((operand_a_3_3 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_3 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_3;
                }
                if((operand_a_3_4 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_4 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_4;
                }
                if((operand_a_3_5 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_5 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_5;
                }
                if((operand_a_3_6 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_6 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_6;
                }
                if((operand_a_3_7 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_7 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_7;
                }
                if((operand_a_3_8 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_8 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_8;
                }
                if((operand_a_3_9 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_9 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_9;
                }
                if((operand_a_3_10 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_10 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_10;
                }
                if((operand_a_3_11 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_11 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_11;
                }
                if((operand_a_3_12 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_12 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_12;
                }
                if((operand_a_3_13 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_13 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_13;
                }
                if((operand_a_3_14 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_14 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_14;
                }
                if((operand_a_3_15 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_15 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_15;
                }
                if((operand_a_3_16 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_16 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_16;
                }
                if((operand_a_3_17 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_17 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_17;
                }
                if((operand_a_3_18 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_18 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_18;
                }
                if((operand_a_3_19 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_19 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_19;
                }
                if((operand_a_3_20 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_20 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_20;
                }
                if((operand_a_3_21 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_21 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_21;
                }
                if((operand_a_3_22 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_22 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_22;
                }
                if((operand_a_3_23 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_23 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_23;
                }
                if((operand_a_3_24 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_24 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_24;
                }
                if((operand_a_3_25 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_25 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_25;
                }
                if((operand_a_3_26 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_26 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_26;
                }
                if((operand_a_3_27 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_27 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_27;
                }
                if((operand_a_3_28 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_28 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_28;
                }
                if((operand_a_3_29 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_29 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_29;
                }
                if((operand_a_3_30 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_30 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_30;
                }
                if((operand_a_3_31 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_31 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_31;
                }
                if((operand_a_3_32 & (1 << (WORDSIZE-1))) > 0){ // negative number
                    operand_a_3_32 = ((1 << D_WORDSIZE) - (1 << WORDSIZE)) + (bit<D_WORDSIZE>) operand_a_3_32;
                }
                // perform multiplication and shift to transform data back to wordsize
                bit<D_WORDSIZE> res_3_1 = ((operand_a_3_1 * operand_b1) >> PRECISION);
                bit<D_WORDSIZE> res_3_2 = ((operand_a_3_2 * operand_b2) >> PRECISION);
                bit<D_WORDSIZE> res_3_3 = ((operand_a_3_3 * operand_b3) >> PRECISION);
                bit<D_WORDSIZE> res_3_4 = ((operand_a_3_4 * operand_b4) >> PRECISION);
                bit<D_WORDSIZE> res_3_5 = ((operand_a_3_5 * operand_b5) >> PRECISION);
                bit<D_WORDSIZE> res_3_6 = ((operand_a_3_6 * operand_b6) >> PRECISION);
                bit<D_WORDSIZE> res_3_7 = ((operand_a_3_7 * operand_b7) >> PRECISION);
                bit<D_WORDSIZE> res_3_8 = ((operand_a_3_8 * operand_b8) >> PRECISION);
                bit<D_WORDSIZE> res_3_9 = ((operand_a_3_9 * operand_b9) >> PRECISION);
                bit<D_WORDSIZE> res_3_10 = ((operand_a_3_10 * operand_b10) >> PRECISION);
                bit<D_WORDSIZE> res_3_11 = ((operand_a_3_11 * operand_b11) >> PRECISION);
                bit<D_WORDSIZE> res_3_12 = ((operand_a_3_12 * operand_b12) >> PRECISION);
                bit<D_WORDSIZE> res_3_13 = ((operand_a_3_13 * operand_b13) >> PRECISION);
                bit<D_WORDSIZE> res_3_14 = ((operand_a_3_14 * operand_b14) >> PRECISION);
                bit<D_WORDSIZE> res_3_15 = ((operand_a_3_15 * operand_b15) >> PRECISION);
                bit<D_WORDSIZE> res_3_16 = ((operand_a_3_16 * operand_b16) >> PRECISION);
                bit<D_WORDSIZE> res_3_17 = ((operand_a_3_17 * operand_b17) >> PRECISION);
                bit<D_WORDSIZE> res_3_18 = ((operand_a_3_18 * operand_b18) >> PRECISION);
                bit<D_WORDSIZE> res_3_19 = ((operand_a_3_19 * operand_b19) >> PRECISION);
                bit<D_WORDSIZE> res_3_20 = ((operand_a_3_20 * operand_b20) >> PRECISION);
                bit<D_WORDSIZE> res_3_21 = ((operand_a_3_21 * operand_b21) >> PRECISION);
                bit<D_WORDSIZE> res_3_22 = ((operand_a_3_22 * operand_b22) >> PRECISION);
                bit<D_WORDSIZE> res_3_23 = ((operand_a_3_23 * operand_b23) >> PRECISION);
                bit<D_WORDSIZE> res_3_24 = ((operand_a_3_24 * operand_b24) >> PRECISION);
                bit<D_WORDSIZE> res_3_25 = ((operand_a_3_25 * operand_b25) >> PRECISION);
                bit<D_WORDSIZE> res_3_26 = ((operand_a_3_26 * operand_b26) >> PRECISION);
                bit<D_WORDSIZE> res_3_27 = ((operand_a_3_27 * operand_b27) >> PRECISION);
                bit<D_WORDSIZE> res_3_28 = ((operand_a_3_28 * operand_b28) >> PRECISION);
                bit<D_WORDSIZE> res_3_29 = ((operand_a_3_29 * operand_b29) >> PRECISION);
                bit<D_WORDSIZE> res_3_30 = ((operand_a_3_30 * operand_b30) >> PRECISION);
                bit<D_WORDSIZE> res_3_31 = ((operand_a_3_31 * operand_b31) >> PRECISION);
                bit<D_WORDSIZE> res_3_32 = ((operand_a_3_32 * operand_b32) >> PRECISION);

                // Compute the summation
                meta.neuron_3_data = meta.neuron_3_data + (bit<WORDSIZE>) res_3_1 + (bit<WORDSIZE>) res_3_2 + (bit<WORDSIZE>) res_3_3 + (bit<WORDSIZE>) res_3_4 + (bit<WORDSIZE>) res_3_5 + (bit<WORDSIZE>) res_3_6 + (bit<WORDSIZE>) res_3_7 + (bit<WORDSIZE>) res_3_8 + (bit<WORDSIZE>) res_3_9 + (bit<WORDSIZE>) res_3_10 + (bit<WORDSIZE>) res_3_11 + (bit<WORDSIZE>) res_3_12 + (bit<WORDSIZE>) res_3_13 + (bit<WORDSIZE>) res_3_14 + (bit<WORDSIZE>) res_3_15 + (bit<WORDSIZE>) res_3_16 + (bit<WORDSIZE>) res_3_17 + (bit<WORDSIZE>) res_3_18 + (bit<WORDSIZE>) res_3_19 + (bit<WORDSIZE>) res_3_20 + (bit<WORDSIZE>) res_3_21 + (bit<WORDSIZE>) res_3_22 + (bit<WORDSIZE>) res_3_23 + (bit<WORDSIZE>) res_3_24 + (bit<WORDSIZE>) res_3_25 + (bit<WORDSIZE>) res_3_26 + (bit<WORDSIZE>) res_3_27 + (bit<WORDSIZE>) res_3_28 + (bit<WORDSIZE>) res_3_29 + (bit<WORDSIZE>) res_3_30 + (bit<WORDSIZE>) res_3_31 + (bit<WORDSIZE>) res_3_32;
                // Store data to be fowarded
                reg_neuron_3_data.write(0, meta.neuron_3_data);
            }
            else if(meta.agg_func == FUNC_ARGMAX){
                // the data to be fowarded (neuron_1_data) is the ID of the switch with highest value.
                // neuron_2_data is the index of the neuron with highest value inside the same switch.
                // the highest data (neuron_max_value) is kept to be compared by other neurons.
                bit<WORDSIZE> op_a = 0;
                bit<WORDSIZE> op_b = 0;
                bit<1> op_a_sig = 0;
                bit<1> op_b_sig = 0;
                if(meta.n_received_stimuli == 1){
                    // if first stimuli, then assume first data received is the higher, then check the remmaining data against it
                    // Neuron 1
                    meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                    meta.neuron_2_data = 0; // neuron_2_data stores the index of the neuron with highest value within same switch
                    meta.neuron_max_value = hdr.ann.data_1;

                    // Neuron 2
                    // Check if data is higher than stored max data
                    op_a = hdr.ann.data_2; 			// op_a is the data being evaluated if it's higher then the stored one (op_b)
                    op_b = meta.neuron_max_value;		// op_b is the store of max value until now
                    op_a_sig = (bit<1>)(op_a & (1 << (WORDSIZE-1)) > 0);
                    op_b_sig = (bit<1>)(op_b & (1 << (WORDSIZE-1)) > 0);
                    // There are two situation in which op_a is bigger then op_b
                    if((op_a_sig == 0) && (op_b_sig  == 1)){ // The first: if the op_a is positive and op_b is negative
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 1;
                        meta.neuron_max_value = hdr.ann.data_2;
                    } else if(op_a_sig == op_b_sig && op_a > op_b){ // The second: if the signal is the same, and op_a > op_b
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 1;
                        meta.neuron_max_value = hdr.ann.data_2;
                    }
                    // Neuron 3
                    // Check if data is higher than stored max data
                    op_a = hdr.ann.data_3; 			// op_a is the data being evaluated if it's higher then the stored one (op_b)
                    op_b = meta.neuron_max_value;		// op_b is the store of max value until now
                    op_a_sig = (bit<1>)(op_a & (1 << (WORDSIZE-1)) > 0);
                    op_b_sig = (bit<1>)(op_b & (1 << (WORDSIZE-1)) > 0);
                    // There are two situation in which op_a is bigger then op_b
                    if((op_a_sig == 0) && (op_b_sig  == 1)){ // The first: if the op_a is positive and op_b is negative
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 2;
                        meta.neuron_max_value = hdr.ann.data_3;
                    } else if(op_a_sig == op_b_sig && op_a > op_b){ // The second: if the signal is the same, and op_a > op_b
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 2;
                        meta.neuron_max_value = hdr.ann.data_3;
                    }
                }
                else{
                    // this is wrong!?!? reg_neuron_1_data.read(meta.neuron_1_data, 0);
                    reg_neuron_max_value.read(meta.neuron_max_value, 0);

                    // Neuron 1
                    // Check if data is higher than stored max data
                    op_a = hdr.ann.data_1; 			// op_a is the data being evaluated if it's higher then the stored one (op_b)
                    op_b = meta.neuron_max_value;		// op_b is the store of max value until now
                    op_a_sig = (bit<1>)(op_a & (1 << (WORDSIZE-1)) > 0);
                    op_b_sig = (bit<1>)(op_b & (1 << (WORDSIZE-1)) > 0);
                    // There are two situation in which op_a is bigger then op_b
                    if((op_a_sig == 0) && (op_b_sig  == 1)){ // The first: if the op_a is positive and op_b is negative
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 0;
                        meta.neuron_max_value = hdr.ann.data_1;
                    } else if(op_a_sig == op_b_sig && op_a > op_b){ // The second: if the signal is the same, and op_a > op_b
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 0;
                        meta.neuron_max_value = hdr.ann.data_1;
                    }
                    // Neuron 2
                    // Check if data is higher than stored max data
                    op_a = hdr.ann.data_2; 			// op_a is the data being evaluated if it's higher then the stored one (op_b)
                    op_b = meta.neuron_max_value;		// op_b is the store of max value until now
                    op_a_sig = (bit<1>)(op_a & (1 << (WORDSIZE-1)) > 0);
                    op_b_sig = (bit<1>)(op_b & (1 << (WORDSIZE-1)) > 0);
                    // There are two situation in which op_a is bigger then op_b
                    if((op_a_sig == 0) && (op_b_sig  == 1)){ // The first: if the op_a is positive and op_b is negative
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 1;
                        meta.neuron_max_value = hdr.ann.data_2;
                    } else if(op_a_sig == op_b_sig && op_a > op_b){ // The second: if the signal is the same, and op_a > op_b
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 1;
                        meta.neuron_max_value = hdr.ann.data_2;
                    }
                    // Neuron 3
                    // Check if data is higher than stored max data
                    op_a = hdr.ann.data_3; 			// op_a is the data being evaluated if it's higher then the stored one (op_b)
                    op_b = meta.neuron_max_value;		// op_b is the store of max value until now
                    op_a_sig = (bit<1>)(op_a & (1 << (WORDSIZE-1)) > 0);
                    op_b_sig = (bit<1>)(op_b & (1 << (WORDSIZE-1)) > 0);
                    // There are two situation in which op_a is bigger then op_b
                    if((op_a_sig == 0) && (op_b_sig  == 1)){ // The first: if the op_a is positive and op_b is negative
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 2;
                        meta.neuron_max_value = hdr.ann.data_3;
                    } else if(op_a_sig == op_b_sig && op_a > op_b){ // The second: if the signal is the same, and op_a > op_b
                        //meta.neuron_1_data = (bit<WORDSIZE>) hdr.ann.neuron_id;
                        meta.neuron_2_data = 2;
                        meta.neuron_max_value = hdr.ann.data_3;
                    }
                }
                reg_neuron_1_data.write(0, meta.neuron_1_data);
                reg_neuron_2_data.write(0, meta.neuron_2_data);
                reg_neuron_max_value.write(0, meta.neuron_max_value);
                // in the argmax function, neuron 3 data and neuron 4 data are not needed, set to 99 just for testing. Could use a different header for this layer so we don't have empty fileds.
                meta.neuron_3_data = 99;
                reg_neuron_3_data.write(0, meta.neuron_3_data);
                meta.neuron_4_data = 99;
                reg_neuron_4_data.write(0, meta.neuron_4_data);
                meta.neuron_5_data = 99;
                reg_neuron_5_data.write(0, meta.neuron_5_data);
                meta.neuron_6_data = 99;
                reg_neuron_6_data.write(0, meta.neuron_6_data);
                meta.neuron_7_data = 99;
                reg_neuron_7_data.write(0, meta.neuron_7_data);
                meta.neuron_8_data = 99;
                reg_neuron_8_data.write(0, meta.neuron_8_data);
                meta.neuron_9_data = 99;
                reg_neuron_9_data.write(0, meta.neuron_9_data);
                meta.neuron_10_data = 99;
                reg_neuron_10_data.write(0, meta.neuron_10_data);
                meta.neuron_11_data = 99;
                reg_neuron_11_data.write(0, meta.neuron_11_data);
                meta.neuron_12_data = 99;
                reg_neuron_12_data.write(0, meta.neuron_12_data);
                meta.neuron_13_data = 99;
                reg_neuron_13_data.write(0, meta.neuron_13_data);
                meta.neuron_14_data = 99;
                reg_neuron_14_data.write(0, meta.neuron_14_data);
                meta.neuron_15_data = 99;
                reg_neuron_15_data.write(0, meta.neuron_15_data);
                meta.neuron_16_data = 99;
                reg_neuron_16_data.write(0, meta.neuron_16_data);
                meta.neuron_17_data = 99;
                reg_neuron_17_data.write(0, meta.neuron_17_data);
                meta.neuron_18_data = 99;
                reg_neuron_18_data.write(0, meta.neuron_18_data);
                meta.neuron_19_data = 99;
                reg_neuron_19_data.write(0, meta.neuron_19_data);
                meta.neuron_20_data = 99;
                reg_neuron_20_data.write(0, meta.neuron_20_data);
                meta.neuron_21_data = 99;
                reg_neuron_21_data.write(0, meta.neuron_21_data);
                meta.neuron_22_data = 99;
                reg_neuron_22_data.write(0, meta.neuron_22_data);
                meta.neuron_23_data = 99;
                reg_neuron_23_data.write(0, meta.neuron_23_data);
                meta.neuron_24_data = 99;
                reg_neuron_24_data.write(0, meta.neuron_24_data);
                meta.neuron_25_data = 99;
                reg_neuron_25_data.write(0, meta.neuron_25_data);
                meta.neuron_26_data = 99;
                reg_neuron_26_data.write(0, meta.neuron_26_data);
                meta.neuron_27_data = 99;
                reg_neuron_27_data.write(0, meta.neuron_27_data);
                meta.neuron_28_data = 99;
                reg_neuron_28_data.write(0, meta.neuron_28_data);
                meta.neuron_29_data = 99;
                reg_neuron_29_data.write(0, meta.neuron_29_data);
                meta.neuron_30_data = 99;
                reg_neuron_30_data.write(0, meta.neuron_30_data);
                meta.neuron_31_data = 99;
                reg_neuron_31_data.write(0, meta.neuron_31_data);
                meta.neuron_32_data = 99;
                reg_neuron_32_data.write(0, meta.neuron_32_data);
            }
            else if(meta.agg_func == FUNC_IDENTITY){
                meta.neuron_1_data = hdr.ann.data_1;
                reg_neuron_1_data.write(0, meta.neuron_1_data);

                meta.neuron_2_data = hdr.ann.data_2;
                reg_neuron_2_data.write(0, meta.neuron_2_data);

                meta.neuron_3_data = hdr.ann.data_3;
                reg_neuron_3_data.write(0, meta.neuron_3_data);

                meta.neuron_4_data = hdr.ann.data_4;
                reg_neuron_4_data.write(0, meta.neuron_4_data);

                meta.neuron_5_data = hdr.ann.data_5;
                reg_neuron_5_data.write(0, meta.neuron_5_data);

                meta.neuron_6_data = hdr.ann.data_6;
                reg_neuron_6_data.write(0, meta.neuron_6_data);

                meta.neuron_7_data = hdr.ann.data_7;
                reg_neuron_7_data.write(0, meta.neuron_7_data);

                meta.neuron_8_data = hdr.ann.data_8;
                reg_neuron_8_data.write(0, meta.neuron_8_data);

                meta.neuron_9_data = hdr.ann.data_9;
                reg_neuron_9_data.write(0, meta.neuron_9_data);

                meta.neuron_10_data = hdr.ann.data_10;
                reg_neuron_10_data.write(0, meta.neuron_10_data);

                meta.neuron_11_data = hdr.ann.data_11;
                reg_neuron_11_data.write(0, meta.neuron_11_data);

                meta.neuron_12_data = hdr.ann.data_12;
                reg_neuron_12_data.write(0, meta.neuron_12_data);

                meta.neuron_13_data = hdr.ann.data_13;
                reg_neuron_13_data.write(0, meta.neuron_13_data);

                meta.neuron_14_data = hdr.ann.data_14;
                reg_neuron_14_data.write(0, meta.neuron_14_data);

                meta.neuron_15_data = hdr.ann.data_15;
                reg_neuron_15_data.write(0, meta.neuron_15_data);

                meta.neuron_16_data = hdr.ann.data_16;
                reg_neuron_16_data.write(0, meta.neuron_16_data);

                meta.neuron_17_data = hdr.ann.data_17;
                reg_neuron_17_data.write(0, meta.neuron_17_data);

                meta.neuron_18_data = hdr.ann.data_18;
                reg_neuron_18_data.write(0, meta.neuron_18_data);

                meta.neuron_19_data = hdr.ann.data_19;
                reg_neuron_19_data.write(0, meta.neuron_19_data);

                meta.neuron_20_data = hdr.ann.data_20;
                reg_neuron_20_data.write(0, meta.neuron_20_data);

                meta.neuron_21_data = hdr.ann.data_21;
                reg_neuron_21_data.write(0, meta.neuron_21_data);

                meta.neuron_22_data = hdr.ann.data_22;
                reg_neuron_22_data.write(0, meta.neuron_22_data);

                meta.neuron_23_data = hdr.ann.data_23;
                reg_neuron_23_data.write(0, meta.neuron_23_data);

                meta.neuron_24_data = hdr.ann.data_24;
                reg_neuron_24_data.write(0, meta.neuron_24_data);

                meta.neuron_25_data = hdr.ann.data_25;
                reg_neuron_25_data.write(0, meta.neuron_25_data);

                meta.neuron_26_data = hdr.ann.data_26;
                reg_neuron_26_data.write(0, meta.neuron_26_data);

                meta.neuron_27_data = hdr.ann.data_27;
                reg_neuron_27_data.write(0, meta.neuron_27_data);

                meta.neuron_28_data = hdr.ann.data_28;
                reg_neuron_28_data.write(0, meta.neuron_28_data);

                meta.neuron_29_data = hdr.ann.data_29;
                reg_neuron_29_data.write(0, meta.neuron_29_data);

                meta.neuron_30_data = hdr.ann.data_30;
                reg_neuron_30_data.write(0, meta.neuron_30_data);

                meta.neuron_31_data = hdr.ann.data_31;
                reg_neuron_31_data.write(0, meta.neuron_31_data);

                meta.neuron_32_data = hdr.ann.data_32;
                reg_neuron_32_data.write(0, meta.neuron_32_data);
            }

            //  After computing aggregation functions, check if all stimuli have been received to proced to activation function
            tab_n_expected_stimuli.apply();                             // Get the number of expected stimuli for the neuron
            if(meta.n_received_stimuli == meta.n_expected_stimuli){     // Check if the number of expected stimuli was just reached, if yes, the neuron_data is the final value, we should propagate it
                tab_neuron_id.apply();                                  // Get the neuron ID
                if(meta.neuron_id > 0){
                    hdr.ann.neuron_id = meta.neuron_id;                 // Overwrite the fields in the ANN header
                }
                tab_activation_func.apply();                            // Get the neuron activation function
                if(meta.activation_func == FUNC_RELU){
                    if(meta.neuron_1_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_1_data = 0;
                    }
                    hdr.ann.data_1 = meta.neuron_1_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_2_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_2_data = 0;
                    }
                    hdr.ann.data_2 = meta.neuron_2_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_3_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_3_data = 0;
                    }
                    hdr.ann.data_3 = meta.neuron_3_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_4_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_4_data = 0;
                    }
                    hdr.ann.data_4 = meta.neuron_4_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_5_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_5_data = 0;
                    }
                    hdr.ann.data_5 = meta.neuron_5_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_6_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_6_data = 0;
                    }
                    hdr.ann.data_6 = meta.neuron_6_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_7_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_7_data = 0;
                    }
                    hdr.ann.data_7 = meta.neuron_7_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_8_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_8_data = 0;
                    }
                    hdr.ann.data_8 = meta.neuron_8_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_9_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_9_data = 0;
                    }
                    hdr.ann.data_9 = meta.neuron_9_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_10_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_10_data = 0;
                    }
                    hdr.ann.data_10 = meta.neuron_10_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_11_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_11_data = 0;
                    }
                    hdr.ann.data_11 = meta.neuron_11_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_12_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_12_data = 0;
                    }
                    hdr.ann.data_12 = meta.neuron_12_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_13_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_13_data = 0;
                    }
                    hdr.ann.data_13 = meta.neuron_13_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_14_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_14_data = 0;
                    }
                    hdr.ann.data_14 = meta.neuron_14_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_15_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_15_data = 0;
                    }
                    hdr.ann.data_15 = meta.neuron_15_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_16_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_16_data = 0;
                    }
                    hdr.ann.data_16 = meta.neuron_16_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_17_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_17_data = 0;
                    }
                    hdr.ann.data_17 = meta.neuron_17_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_18_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_18_data = 0;
                    }
                    hdr.ann.data_18 = meta.neuron_18_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_19_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_19_data = 0;
                    }
                    hdr.ann.data_19 = meta.neuron_19_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_20_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_20_data = 0;
                    }
                    hdr.ann.data_20 = meta.neuron_20_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_21_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_21_data = 0;
                    }
                    hdr.ann.data_21 = meta.neuron_21_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_22_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_22_data = 0;
                    }
                    hdr.ann.data_22 = meta.neuron_22_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_23_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_23_data = 0;
                    }
                    hdr.ann.data_23 = meta.neuron_23_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_24_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_24_data = 0;
                    }
                    hdr.ann.data_24 = meta.neuron_24_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_25_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_25_data = 0;
                    }
                    hdr.ann.data_25 = meta.neuron_25_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_26_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_26_data = 0;
                    }
                    hdr.ann.data_26 = meta.neuron_26_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_27_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_27_data = 0;
                    }
                    hdr.ann.data_27 = meta.neuron_27_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_28_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_28_data = 0;
                    }
                    hdr.ann.data_28 = meta.neuron_28_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_29_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_29_data = 0;
                    }
                    hdr.ann.data_29 = meta.neuron_29_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_30_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_30_data = 0;
                    }
                    hdr.ann.data_30 = meta.neuron_30_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_31_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_31_data = 0;
                    }
                    hdr.ann.data_31 = meta.neuron_31_data;                    // Overwrite the fields in the ANN header

                    if(meta.neuron_32_data & (1 << (WORDSIZE-1)) > 0){     // Relu: if negative, set data to 0
                        meta.neuron_32_data = 0;
                    }
                    hdr.ann.data_32 = meta.neuron_32_data;                    // Overwrite the fields in the ANN header
                }
                else if(meta.activation_func == FUNC_IDENTITY){
                    hdr.ann.data_1 = meta.neuron_1_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_2 = meta.neuron_2_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_3 = meta.neuron_3_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_4 = meta.neuron_4_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_5 = meta.neuron_5_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_6 = meta.neuron_6_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_7 = meta.neuron_7_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_8 = meta.neuron_8_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_9 = meta.neuron_9_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_10 = meta.neuron_10_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_11 = meta.neuron_11_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_12 = meta.neuron_12_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_13 = meta.neuron_13_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_14 = meta.neuron_14_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_15 = meta.neuron_15_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_16 = meta.neuron_16_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_17 = meta.neuron_17_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_18 = meta.neuron_18_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_19 = meta.neuron_19_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_20 = meta.neuron_20_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_21 = meta.neuron_21_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_22 = meta.neuron_22_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_23 = meta.neuron_23_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_24 = meta.neuron_24_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_25 = meta.neuron_25_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_26 = meta.neuron_26_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_27 = meta.neuron_27_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_28 = meta.neuron_28_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_29 = meta.neuron_29_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_30 = meta.neuron_30_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_31 = meta.neuron_31_data;                    // Overwrite the fields in the ANN header
                    hdr.ann.data_32 = meta.neuron_32_data;                    // Overwrite the fields in the ANN header
                }

                reg_received_stimuli.write(0, 0);                     // Reset the registers related to received stimuli
                reg_n_received_stimuli.write(0, 0);
                ann_forward.apply();                                    // Forward the packet according to the ANN forwarding logic
            }
            else {
                drop();
            }
        }
    }
}
}

/*************************************************************************
****************  E G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control MyEgress(inout headers hdr,
                inout metadata meta,
                inout standard_metadata_t standard_metadata) {
    apply {}
}

/*************************************************************************
*************   C H E C K S U M    C O M P U T A T I O N   **************
*************************************************************************/

control MyComputeChecksum(inout headers  hdr, inout metadata meta) {
    apply {}
}

/*************************************************************************
***********************  D E P A R S E R  *******************************
*************************************************************************/

control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.ethernet);
        packet.emit(hdr.ann);
    }
}

/*************************************************************************
***********************  S W I T C H  *******************************
*************************************************************************/

V1Switch(
MyParser(),
MyVerifyChecksum(),
MyIngress(),
MyEgress(),
MyComputeChecksum(),
MyDeparser()
) main;
