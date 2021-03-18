#v.1.2
#carpar_table is generated by external rule file
import sys

carpar_table={}
def gen_carpar_table(filename):
    for line in open(filename,'r').readlines():
        carpar_rule=line.split()
        if len(carpar_rule)>=2:
            carpar_table[carpar_rule[0]]=carpar_rule[1]
    carpar_h=[line.split()[1] for line in open(sys.argv[1], "r").readlines()]
    for c in carpar_table.keys():
        if not c in carpar_h:
            print "%s doesn't exist in Car_par.h"%c
            print "Please check Car_par_gen.rule\n\n"
            sys.exit(-1)
def check(line):
    val, msg =line.split()[1:], ""
    if len(val) >= 2 and carpar_table.has_key(val[0]):
        for v in val[1:]: msg += v
        return carpar_table[val[0]]+" := "+msg+'\n'
    return ''

if __name__ == "__main__":
    if len(sys.argv) == 4:
        gen_carpar_table(sys.argv[2])
        open(sys.argv[3], "w").writelines(
            [check(line) for line in open(sys.argv[1], "r").readlines()] )
    else:
        # show help message
        print "python parse_Car_par.py carpar_gen_h carpar_gen_rule carpar_gen_mak"
        print "      ex) python parse_Car_par.py Car_par_gen.h Car_par_gen.rule mando_carpar_gen_cfg.mak"
        sys.exit(-1)


#v.1.1
#carpar_table is defined in python file
# import sys
#
# carpar_table={
#     #'M_CAR':'__TEST_VARIANT_CAR',
#     #'M_CAR_MAKER':'__TEST_VARIANT_CAR_MAKER',
#     'IDB_ECU_DV_LEVEL':'IDB_ECU_DV_LEVEL',
# }
#
# def check(line):
#     val, msg =line.split()[1:], ""
#     if len(val) >= 2 and carpar_table.has_key(val[0]):
#         for v in val[1:]: msg += v
#         return carpar_table[val[0]]+" := "+msg+'\n'
#     return ''
#
# if __name__ == "__main__":
#     if len(sys.argv) == 3:
#         open(sys.argv[2], "w").writelines(
#             [check(l) for l in open(sys.argv[1], "r").readlines()] )
#     else:
#         # show help message
#         print "python parse_Car_par.py carpar_h carpar_mak"
#         print "      ex) python parse_Car_par.py Car_par_gen.h mando_carpar_gen_cfg.mak"
#         exit(-1)
#

