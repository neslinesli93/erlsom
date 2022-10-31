## Local development

1. Install `rebar` with asdf-plugin: https://github.com/Stratus3D/asdf-rebar
2. Install VSCode extensions for erlang and erlang-ls
3. Open a shell with `make shell`
4. Compile `src`:

```erl
cd("src").
c("erlsom", debug_info),
c("erlsom_parse", debug_info),
c("erlsom_lib", debug_info),
c("erlsom_compile", debug_info),
c("erlsom_write", debug_info),
c("erlsom_parseXsd", debug_info),
c("erlsom_sax", debug_info),
c("erlsom_pass2", debug_info),
c("erlsom_writeHrl", debug_info),
c("erlsom_add", debug_info),
c("erlsom_ucs", debug_info),
c("erlsom_sax_utf8", debug_info),
c("erlsom_sax_latin1", debug_info),
c("erlsom_sax_latin9", debug_info),
c("erlsom_sax_utf16be", debug_info),
c("erlsom_sax_utf16le", debug_info),
c("erlsom_sax_list", debug_info),
c("erlsom_sax_lib", debug_info),
c("erlsom_simple_form", debug_info).
```

5. Compile an example if you need it

```erl
cd("examples/erlsom_example").
c("erlsom_example", debug_info).
```

6. Run the example:

```erl
erlsom_example:run().
```
