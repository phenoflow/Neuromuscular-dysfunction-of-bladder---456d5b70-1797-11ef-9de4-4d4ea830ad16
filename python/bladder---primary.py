# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"52174.0","system":"readv2"},{"code":"887.0","system":"readv2"},{"code":"31097.0","system":"readv2"},{"code":"90866.0","system":"readv2"},{"code":"41628.0","system":"readv2"},{"code":"11490.0","system":"readv2"},{"code":"34452.0","system":"readv2"},{"code":"98192.0","system":"readv2"},{"code":"49372.0","system":"readv2"},{"code":"108426.0","system":"readv2"},{"code":"6676.0","system":"readv2"},{"code":"7680.0","system":"readv2"},{"code":"11162.0","system":"readv2"},{"code":"5309.0","system":"readv2"},{"code":"29881.0","system":"readv2"},{"code":"31318.0","system":"readv2"},{"code":"2248.0","system":"readv2"},{"code":"25836.0","system":"readv2"},{"code":"32697.0","system":"readv2"},{"code":"5993.0","system":"readv2"},{"code":"25398.0","system":"readv2"},{"code":"30941.0","system":"readv2"},{"code":"4998.0","system":"readv2"},{"code":"37502.0","system":"readv2"},{"code":"56009.0","system":"readv2"},{"code":"21278.0","system":"readv2"},{"code":"37444.0","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('neuromuscular-dysfunction-of-bladder-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["bladder---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["bladder---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["bladder---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
