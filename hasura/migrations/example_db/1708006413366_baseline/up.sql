SET check_function_bodies = false;
CREATE TABLE public.example_table (
    id integer NOT NULL
);
ALTER TABLE ONLY public.example_table
    ADD CONSTRAINT example_table_pkey PRIMARY KEY (id);
