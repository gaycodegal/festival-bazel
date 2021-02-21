licenses(["notice"]) # BSD
load("//bzl:rules_fest.bzl", "make_libraries")

make_libraries(
    deps = [
        "//speech_tools/include",
        "//speech_tools/base_class:base_class_estbase",
    ],
    DIRNAME="base_class/inst_tmpl",
    LOCAL_DEFAULT_LIBRARY = "estbase",
    TSRCS = "list_i_t.cc list_si_t.cc list_f_t.cc list_d_t.cc \
	list_c_t.cc list_s_t.cc \
        list_val_t.cc \
	list_li_t.cc list_vs_t.cc list_vi_t.cc \
	\
	matrix_i_t.cc matrix_si_t.cc matrix_f_t.cc matrix_d_t.cc \
	matrix_s_t.cc \
        matrix_val_t.cc \
	\
	vector_i_t.cc vector_si_t.cc vector_f_t.cc vector_d_t.cc \
	vector_c_t.cc vector_s_t.cc \
        vector_val_t.cc vector_ls_t.cc \
	vector_fvector_t.cc vector_fmatrix_t.cc \
	vector_dvector_t.cc vector_dmatrix_t.cc \
	\
	kvl_fi_t.cc kvl_ii_t.cc kvl_sd_t.cc kvl_sf_t.cc \
        kvl_ss_t.cc kvl_si_t.cc kvl_sv_t.cc kvl_rs_t.cc kvl_vpi_t.cc \
	\
	hash_fi_t.cc hash_ii_t.cc hash_sd_t.cc hash_sf_t.cc \
        hash_ss_t.cc hash_si_t.cc hash_sv_t.cc hash_iv_t.cc \
        hash_sfmp_t.cc hash_srp.cc \
	\
	tbuffer_t.cc \
	\
	deq_s_t.cc deq_i_t.cc \
	\
",
    #	kvl_srcfmp_t.cc kvl_scsmm_t.cc matrix_c_t.cc 

    CPPSRCS = "",

    SRCS = "$(CPPSRCS)",
)
