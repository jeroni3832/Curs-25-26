ALTER TABLE animal
	ADD COLUMN id_persona INT,
    ADD CONSTRAINT fk_persona_animal FOREIGN KEY (id_persona) REFERENCES persona(id);