SET check_function_bodies = false;
CREATE TABLE public.ingredient_types (
    id integer NOT NULL,
    label text NOT NULL
);
COMMENT ON TABLE public.ingredient_types IS 'This table stores the ingredient types, like "vegetable", "fruit", "condiment", "red meat", etc...';
CREATE SEQUENCE public.ingredient_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.ingredient_types_id_seq OWNED BY public.ingredient_types.id;
CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name text NOT NULL,
    ingredient_type_id integer
);
COMMENT ON TABLE public.ingredients IS 'The ingredients table stores all the ingredients, and in further version, maybe more informations about them.';
CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;
CREATE TABLE public.receipe_ingredients (
    receipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantity numeric
);
COMMENT ON TABLE public.receipe_ingredients IS 'This table contains all the receipe''s ingredients, and the quantity assigned to each ingredient';
CREATE TABLE public.receipes (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL
);
COMMENT ON TABLE public.receipes IS 'This table is related to receipes "headers", including the title de description, and in further version, the authors';
CREATE SEQUENCE public.receipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.receipes_id_seq OWNED BY public.receipes.id;
ALTER TABLE ONLY public.ingredient_types ALTER COLUMN id SET DEFAULT nextval('public.ingredient_types_id_seq'::regclass);
ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);
ALTER TABLE ONLY public.receipes ALTER COLUMN id SET DEFAULT nextval('public.receipes_id_seq'::regclass);
ALTER TABLE ONLY public.ingredient_types
    ADD CONSTRAINT ingredient_types_label_key UNIQUE (label);
ALTER TABLE ONLY public.ingredient_types
    ADD CONSTRAINT ingredient_types_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_name_key UNIQUE (name);
ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.receipe_ingredients
    ADD CONSTRAINT receipe_ingredients_pkey PRIMARY KEY (receipe_id, ingredient_id);
ALTER TABLE ONLY public.receipes
    ADD CONSTRAINT receipes_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_ingredient_type_id_fkey FOREIGN KEY (ingredient_type_id) REFERENCES public.ingredient_types(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE ONLY public.receipe_ingredients
    ADD CONSTRAINT receipe_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.receipe_ingredients
    ADD CONSTRAINT receipe_ingredients_receipe_id_fkey FOREIGN KEY (receipe_id) REFERENCES public.receipes(id) ON UPDATE CASCADE ON DELETE CASCADE;
