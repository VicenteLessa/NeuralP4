
import sys
import socket
import struct
import re
import math
import json
import pandas as pd
import numpy as np
import threading
import queue
from scapy.all import *

# Creating the config dict in loco, maybe best would be to be in a file
cfg = {
    "input_dataset_filename": "csv-files-input/df-test-stream-video.csv",
    "output_csv_filename": "csv-files-output/p4-out-stream-video-32x32x4-q8_8.csv",
    "input_switches": [
        {
            "name": "s1",
            "iface": "s1-eth1",
            "id": "s1"
        }
    ],
    "output_switches": [
        {
            "name": "P4_class",
            "iface": "s126-eth2",
            "neuron_id": 126,
            "proc": lambda x: x,
        },
        {
            "name": "output_s101",
            "iface": "s126-eth101",
            "neuron_id": 101,
            "proc": lambda x: x/(2**PRECISION) if x < (2**(WORDSIZE - 1)) else (x-(2**WORDSIZE))/(2**PRECISION)
        }
    ]
}
WORDSIZE = 16
PRECISION = 8
SLACK = 8


def eoConverter(x):
    return x/(2**PRECISION) if x < (2**(WORDSIZE - 1)) else (x-(2**WORDSIZE))/(2**PRECISION)


class ANN(Packet):
    fields_desc = [
        BitField("neuron_id", 0, 32),
        BitField("data_1", 0, WORDSIZE), 
        BitField("data_2", 0, WORDSIZE), 
        BitField("data_3", 0, WORDSIZE), 
        BitField("data_4", 0, WORDSIZE), 
        BitField("data_5", 0, WORDSIZE), 
        BitField("data_6", 0, WORDSIZE), 
        BitField("data_7", 0, WORDSIZE), 
        BitField("data_8", 0, WORDSIZE), 
        BitField("data_9", 0, WORDSIZE), 
        BitField("data_10", 0, WORDSIZE), 
        BitField("data_11", 0, WORDSIZE), 
        BitField("data_12", 0, WORDSIZE), 
        BitField("data_13", 0, WORDSIZE), 
        BitField("data_14", 0, WORDSIZE), 
        BitField("data_15", 0, WORDSIZE), 
        BitField("data_16", 0, WORDSIZE), 
        BitField("data_17", 0, WORDSIZE), 
        BitField("data_18", 0, WORDSIZE), 
        BitField("data_19", 0, WORDSIZE), 
        BitField("data_20", 0, WORDSIZE), 
        BitField("data_21", 0, WORDSIZE), 
        BitField("data_22", 0, WORDSIZE), 
        BitField("data_23", 0, WORDSIZE), 
        BitField("data_24", 0, WORDSIZE), 
        BitField("data_25", 0, WORDSIZE), 
        BitField("data_26", 0, WORDSIZE), 
        BitField("data_27", 0, WORDSIZE), 
        BitField("data_28", 0, WORDSIZE), 
        BitField("data_29", 0, WORDSIZE), 
        BitField("data_30", 0, WORDSIZE), 
        BitField("data_31", 0, WORDSIZE), 
        BitField("data_32", 0, WORDSIZE), 
        BitField("run_id", 0, 16),
        BitField("slack", 0, SLACK)
    ]
    
bind_layers(Ether, ANN, type=0x88B5)


def main(cfg):
    # Read input dataset
    input_dataset = pd.read_csv(cfg["input_dataset_filename"])  #.head(50)

    # Create shared queue and packet sniffer to receive ANN outputs
    packet_queue = queue.Queue()
    output_ifs = [x["iface"] for x in cfg["output_switches"]]
    # print(output_ifs)
    sniffers = []
    for output_iface in output_ifs:
        sniffers.append(
            AsyncSniffer(iface=output_iface, prn=lambda x: packet_queue.put(x), stop_filter=lambda x: x.haslayer(ANN) and x[ANN].neuron_id == 0)
        )
    for sniffer in sniffers:
        sniffer.start()

    # Run each of the dataset test cases
    ann_outputs = pd.DataFrame(columns=["s126_id", "s126_data_1", "s126_data_2", "s126_data_3", "s126_data_4", "s101_id", "s101_data_1", "s101_data_2", "s101_data_3", "s101_data_4"])
    for tc_id, tc in input_dataset.iterrows():
        # Creat input packets
        # print(f"\ntc_id, tc: {tc_id}, {tc}")
        input_pkts = []
        
        for switch in cfg["input_switches"]:
            # print(f"switch: {switch}")
            input_pkts.append((
                switch["iface"],
                Ether(dst='ff:ff:ff:ff:ff:ff', src=get_if_hwaddr(switch["iface"])) / ANN(neuron_id=0, data_1=tc["pkt_3_ipv4_src_23"], data_2=tc["pkt_0_ipv4_src_25"], data_3=tc["pkt_9_ipv4_dst_5"], data_4=tc["pkt_2_rts"], data_5=tc["pkt_9_ipv4_dst_6"], data_6=tc["pkt_9_ipv4_dst_0"], data_7=tc["pkt_4_rts"], data_8=tc["pkt_3_rts"], data_9=tc["pkt_7_ipv4_dst_27"], data_10=tc["pkt_6_tcp_opt_60"], data_11=tc["pkt_6_ipv4_dst_4"], data_12=tc["pkt_0_ipv4_src_18"], data_13=tc["pkt_7_rts"], data_14=tc["pkt_9_ipv4_src_28"], data_15=tc["pkt_4_tcp_opt_60"], data_16=tc["pkt_0_tcp_opt_60"], data_17=tc["pkt_9_ipv4_dst_4"], data_18=tc["pkt_8_rts"], data_19=tc["pkt_4_ipv4_dst_1"], data_20=tc["pkt_8_ipv4_src_28"], data_21=tc["pkt_9_ipv4_dst_3"], data_22=tc["pkt_5_rts"], data_23=tc["pkt_7_ipv4_dst_11"], data_24=tc["pkt_1_rts"], data_25=tc["pkt_9_ipv4_src_21"], data_26=tc["pkt_7_ipv4_dst_9"], data_27=tc["pkt_9_ipv4_dst_13"], data_28=tc["pkt_4_ipv4_dst_12"], data_29=tc["pkt_7_ipv4_dst_0"], data_30=tc["pkt_6_rts"], data_31=tc["pkt_2_ipv4_dst_19"], data_32=tc["pkt_3_ipv4_dst_7"], run_id=tc_id)
            ))
# 
        # print(f"input_pkts: {input_pkts}")
        
        # print("entrou primeiro for")
        # Send input packets as many times needed to receive all expected outputs
        n_expected_outputs = len(cfg["output_switches"])
        n_received_outputs = 0
        received_output = False
        tc_outputs = {}
        

        while n_received_outputs < n_expected_outputs:
            try:
                # If the queue is empty or this is the first iteration
                if not received_output:
                    # Send input packets
                    for iface, pkt in input_pkts:
                        # print(f"||{iface}|| <<{pkt.show()}>>")
                        sendp(pkt, iface=iface, verbose=False)
                

                while n_received_outputs < n_expected_outputs:               
                    
                    # Try to get an output packet
                    out_pkt = packet_queue.get(timeout=1)
                    # print(f"out_pkt: {out_pkt}")

                    # Check if packet is ANN and an output to the current test case                    
                    if ANN in out_pkt and out_pkt[ANN].run_id == tc_id:
                        if out_pkt[ANN].neuron_id == 126:
                            # print("out_pkt[ANN].neuron_id == 126:")                            
                            tc_outputs["s126_id"] = out_pkt[ANN].neuron_id
                            tc_outputs["s126_data_1"] = (out_pkt[ANN].data_1)
                            tc_outputs["s126_data_2"] = (out_pkt[ANN].data_2)
                            tc_outputs["s126_data_3"] = (out_pkt[ANN].data_3)
                            tc_outputs["s126_data_4"] = (out_pkt[ANN].data_4)

                            received_output = True
                            n_received_outputs = n_received_outputs + 1

                        if out_pkt[ANN].neuron_id == 101:
                            # print("out_pkt[ANN].neuron_id == 101:")                          
                            tc_outputs["s101_id"] = out_pkt[ANN].neuron_id
                            tc_outputs["s101_data_1"] = eoConverter(out_pkt[ANN].data_1)
                            tc_outputs["s101_data_2"] = eoConverter(out_pkt[ANN].data_2)
                            tc_outputs["s101_data_3"] = eoConverter(out_pkt[ANN].data_3)
                            tc_outputs["s101_data_4"] = eoConverter(out_pkt[ANN].data_4)

                            received_output = True
                            n_received_outputs = n_received_outputs + 1

                        # if out_pkt[ANN].neuron_id == 51:
                        #     print("out_pkt[ANN].neuron_id == 51:")    

                        
            
            except queue.Empty as error:
                # If queue was empty, we will send input packet again
                print(f"empty queue")
                print(f"ERROR:{error}")
                received_output = False
            except Exception as error:
                # An error here is critical
                print(f"ERROR:{error}")
        #print("cheou no fim do 1o while")

        # Add all desired outputs to the dataframe
        # print(f"tc_outputs: {tc_outputs}")
        ann_outputs.loc[tc_id] = tc_outputs
        print(end=f"\r{tc_id+1}/{len(input_dataset)}")

    for sniffer in sniffers:
        sniffer.stop()

    # Write P4 ANN outputs to a file
    ann_outputs.to_csv(cfg["output_csv_filename"],index=False)


if __name__ == '__main__':
    main(cfg)